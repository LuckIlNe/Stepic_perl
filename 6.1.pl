
use 5.010;
use strict;


my %hash;

while (<STDIN>) {
    chomp $_;
    last if($_ eq "");
    say $_;
    $hash{$_} += 1;
}

print Dumper \%hash;

open(my $fh, '>', "uniq.txt") or die $!;

for (keys %hash) {
    my $n = length($_);
    print $fh "$hash{$_} $n $_\n";
}



close($fh);

__DATA__
string1
string22
string333
string1
string1
string333