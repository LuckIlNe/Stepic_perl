$SIG{CHLD} = 'IGNORE';

my @arr;

while (<STDIN>) {
    last if($_ eq "\n");
    if(my $pid = fork()) {    
        push @arr, hard_work($_);
        waitpid($pid, 0);
    } else {
        die "$!" unless defined $pid;
        push @arr, hard_work($_);
        exit;     
    }
}
$, = "\n";
print sort @arr;