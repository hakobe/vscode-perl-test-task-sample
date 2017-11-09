package Calc;
use v5.26;
use warnings;
use utf8;

sub add {
    my ($class, $x, $y) = @_;
    return $x + $y;
}

sub multiply {
    my ($class, $x, $y) = @_;
    return $x * $y;
}

1;