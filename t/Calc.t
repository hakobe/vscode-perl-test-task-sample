package t::Calc;
use v5.26;
use warnings;
use utf8;
use parent qw(Test::Class);
use Test::More;

BEGIN {
    use_ok('Calc');
};

sub add : Tests {
    is +Calc->add(0, 1), 1;
    is +Calc->add(2, 3), 5;
}

sub multiply : Tests {
    is +Calc->multiply(0, 1), 0;
    is +Calc->multiply(2, 3), 6;
}

__PACKAGE__->runtests;