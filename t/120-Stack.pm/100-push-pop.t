#!/usr/bin/perl

use 5.038;

use strict;
use warnings;
no  warnings 'syntax';

use lib grep {-d} '../lib', '../../lib';

use Test::More 0.88;
use Test::Exception;

our $r = eval "require Test::NoWarnings; 1";

use Language::Fungoid::AFunge::Stack;

my $stack = Language::Fungoid::AFunge::Stack:: -> new;

#
# Push a few things ...
#
my @elements = (3, -7, 0, 123489123);
foreach my $element (@elements) {
    subtest "Pushing '$element'" => sub {
        ok my $result = $stack -> push ($element), "pushed";
        is $result, $stack, "push () returns \$self";
    }
}

foreach my $element (reverse @elements) {
    my $got = $stack -> pop;
    is $got, $element, "pop () returns '$element'";
}

is $stack -> pop, 0, "pop () on empty stack returns 0";

#
# We can only push integers
#
foreach my $element ("a", "", undef, 1.24) {
    throws_ok {$stack -> push ($element)}
              qr /Only integers can be pushed on a stack/,
              "Cannot push " . (defined ($element) ? "'$element'" : "undef")
}

Test::NoWarnings::had_no_warnings () if $r;

done_testing;
