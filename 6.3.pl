use 5.010;

$VAR1 = {
          'b' => [
                   1,
                   '2',
                   3
                 ],
          'a' => 1,
          'c' => {
                   'b' => 2,
                   'a' => 1
                 }
        };

sub serialize {
    my ($value) = @_;
    my $str;
    if (ref $value eq "HASH") {
        $str = '{';
        for (keys %{$value}) {
            $str .= serialize($_);
            $str .= ':' . serialize($value->{$_}) . ',';
        }
        chop $str;
        return $str .= '}';
    }

    if (ref $value eq "ARRAY") {
        $str = '[';
        my @a;
        for (@{$value}) {
            push @a, serialize($_);
        }
        $str .= (join ',', @a);
        return $str .= ']';
    }
    return $value;
}

say serialize($VAR1);