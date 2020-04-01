my $input = <STDIN>; #считываем строку из STDIN
if ($input =~ /\+7 \(\d{3}\) \d{3}-\d{2}-\d{2}/) {
    print "OK\n";
} else {
    print "Not OK\n";
}
