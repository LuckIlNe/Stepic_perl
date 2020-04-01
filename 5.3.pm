package Local::Product;
use 5.010;
use strict;
use Data::Dumper;

sub new() {
    my ($class, %prod) = @_;
    my ($x, $y) = (exists $prod{'price_usd'}, exists $prod{'price_rur'});
    return undef if (!(exists $prod{'name'}) || !((!$x && $y) || ($x && !$y)));
    $prod{'count'} = 1 if (!(exists $prod{'count'}));
    print Dumper \%prod;
    return bless \%prod, $class;
};

sub name {
    my $self = shift;
    $self->{'name'} = shift if @_;
    return $self->{'name'};
};

sub count {
    my $self = shift;
    $self->{'count'} = shift if @_;
    return $self->{'count'};
};

sub price_rur() {
    my ($self, $cost) = @_;
    if ($cost) {
        $self->{'price_rur'} = $cost;
        $self->{'price_usd'} = $cost / 70;
        return ;
    }
    else {
        $self->{'price_rur'} = $self->price_usd * 70 if (!(exists $self->{'price_rur'}));
        return $self->{'price_rur'};
    }
};

sub price_usd() {
    my ($self, $cost) = @_;
    if ($cost) {
        $self->{'price_usd'} = $cost;
        $self->{'price_rur'} = $cost * 70;
        return ;
    }
    else {
        $self->{'price_usd'} = $self->{'price_rur'} / 70 if (!(exists $self->{'price_usd'}));
        return $self->{'price_usd'};
    }    
};

sub sum_rur() {
    my $self = shift;
    return $self->price_rur * $self->count;  
};

sub sum_usd() {
    my $self = shift;
    return $self->price_usd * $self->count;
};

42;