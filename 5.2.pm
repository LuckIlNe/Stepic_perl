package MyFirstPackage; 

sub new($class) {
    my $class = shift @_;
    my %hash = @_;
    return bless \%hash, $class;
}

42;