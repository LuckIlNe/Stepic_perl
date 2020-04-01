# usr/bin/perl

use strict;
use Data::Dumper;
use warnings;
use 5.012;

sub parse_url {
    my ($url) = @_;
    my @keys = qw(schema domain port path query_string anchor);
    my @arr = $url =~  m{
        (?:(?<schema>[^\:\/\\\?\#]+)\:\/\/)?
        (?<domain>[^\#\?:\/]+)
        (?:\:(?<port>\d+))?
        (?<path>[^\?#]+)?
        (?:\?(?<query_string>[^#]+))?
        (?:\#(?<anchor>.+))?
    }x;
    $, = " ";
    print $url, "\n";
    my %hash  = %+; #map { $_ => $+{$_}  } (grep { exists $+{$_} } @keys);

    return \%hash;
}

print Dumper parse_url("mail.ru:8080/");
print Dumper parse_url("http://mail.ru/pp/");
print Dumper parse_url("https://mail.ru/?/1#text");
print Dumper parse_url("https://mail.ru:800/?1");

    
__DATA__

        (?<path>(?:\/\w+)+)?
        (?<query_string>.)?
        (<anchor>.)?