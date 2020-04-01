
require './5.3.pm';
use Data::Dumper;

my $product = Local::Product->new(name => 'hello', price_usd => 350, count => 5);

print $product->price_usd, "\n"; # 350
#print $product->price_usd, "\n"; # 5
print Dumper $product;

$product->price_usd(7);
print $product->price_rur, "\n"; # 490
print $product->price_usd, "\n"; # 7
print Dumper $product;

$product->count(10);
print $product->sum_rur, "\n";   # 4900
print $product->sum_usd, "\n";   # 70
print Dumper $product;