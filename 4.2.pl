use 5.010;

my $package = <STDIN>;
$package =~ s/::/\//;
$, = "\n";
my @arr = map { $_ . "\/$package.pm" } @INC;
print @arr, "\n";
