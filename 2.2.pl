# usr/bin/perl

use strict;
use Data::Dumper;
use warnings;
use 5.012;
use utf8;
binmode(STDOUT,':utf8');

sub anagram {
    my $arrayref = shift;
    my %words = ();
    my %hash = ();

    for (@{$arrayref}) {
        my $w = join("", sort {$a cmp $b} split(//, lc $_));
        if (exists $hash{$w}) {
            my $word = $hash{$w};
            push @{$words{$word}}, lc $_ ;#if ($word ne lc $_);
        }
        else {
            $words{lc $_} = [  lc $_ ]; #lc $_
            $hash{$w} = lc $_;
        }
    }
    my %uniq = ();
    ( @{$words{$_}} = grep ({ !$uniq{$_}++ } @{$words{$_}} ) ) for sort keys %words;
    for  (keys %words) {
        delete $words{$_} if (${$words{$_}}[0] eq $_ && $#{$words{$_}} == 0);
    }
    return \%words ;
}

my @list = qw(пятак
ЛиСток
пятка
стул
ПяТаК
слиток
тяпка
столик
слиток
);
my $result = anagram(\@list);
#my $result = {};
#$result->{1} = qw(1 2 3);
#push(@{$result->{1}}, 1);

(print "$_: @{$result->{$_}}\n") for sort keys %$result;