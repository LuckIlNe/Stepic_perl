my $string = <STDIN>;
print $string, "\n";
$string =~ s/([\^\$\.\|\*\+\?\\\}\{\)\(\]\[])/\\$1/g;

print $string, "\n";


__DATA__
4444tttt1!!:://