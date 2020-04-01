$code = << 'CODE';
    print "Hello world $i \n";
    sub pow {$_[0] ** $_[1]};
    $i += 1;
CODE
use 5.010;
$i = 3;

$val = eval $code;
print $val, "\n";
print $i, "\n";
