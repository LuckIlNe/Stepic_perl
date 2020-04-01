# usr/bin/perl
use strict;
use Data::Dumper;
use warnings;

sub intersection {
    my ($set1, $set2) = @_; 

while ( my ($k,$v) = each %$set1) {
    print "$k => $v\n";
}

while ( my ($k,$v) = each %$set2) {
    print "$k => $v\n";
}
    my %set = map {$_ => 1} (grep { exists $set1->{$_} } %$set2);
    return %set;
}


my %hash1 = (
    1 => 1
);
my %hash2 = (
    "1" => 1
);
Dumper %hash1;
$, = " ";
my %h = intersection(\%hash1, \%hash2);

while ( my ($k,$v) = each %h) {
    print "$k => $v\n";
}