# usr/bin/perl

use strict;
use Data::Dumper;
use warnings;
use 5.012;

sub parse_query_string {
    my ($query_string) = @_;
    my %hash = $query_string =~ /&*([^=]+)=([^=&]+)&*/gm;
    return \%hash;
}

print Dumper parse_query_string("paramValue1&paramValue2&param3=value3&paramValue4");
print Dumper parse_query_string("key1=value1&&key2=value2");
