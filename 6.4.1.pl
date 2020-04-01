use 5.010;
use strict;
use IO::Socket;

my $server = IO::Socket::INET->new(
    LocalPort => 8080,
    Proto => 'tcp',
    Type => SOCK_STREAM,
    ReuseAddr => 1,
    Listen => 10)
or die "$@ $/";

while (my $client = $server->accept()) {
    my $child = fork();
    if ($child) { close($client); next;}
    if (defined $child) {
        close($server);
        $client->autoflush(1);
        while(my $msg = <$client>){
            chop $msg;
            chop $msg;
            exit if ($msg eq 'exit');
            print $client $msg."\n";
        }
    } else { die ""}
}