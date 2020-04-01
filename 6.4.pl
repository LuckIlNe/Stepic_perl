use 5.010;
use strict;
use IO::Socket;

my $server = IO::Socket::INET->new(
    LocalPort => 8081,
    Proto => 'tcp',
    Type => SOCK_STREAM,
    Listen => 10)
or die "$@ $/";

while (my $client = $server->accept()) {
    my $child = fork();
    if ($child) { close($client); next;}
    if (defined $child) {
        close($server);
        $client->autoflush(1);
        my @a;
        while(my $msg = <$client>){
            chop $msg;
            chop $msg;
            last if ($msg eq 'exit');
            #print $client $msg."\n";
            push @a, $msg."\n";
        }
        print $client @a;
        exit;
    } else { die ""}
}
__DATA__

while (my $client = $server->accept()) {
    $client->autoflush(1);
    my @a;
    while(<$client>) {
        chop $_;
        chop $_;
        last if $_ eq 'exit';
        push @a, $_."\n";
    }
    print $client @a;
    close($client);

}
close($server);


jfkfd
fdjkfd
fdkjdf