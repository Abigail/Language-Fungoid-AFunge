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

is $stack -> top,      0, "top () on empty stack returns 0";
is $stack -> top (10), 0, "top (10) on empty stack returns 0";

#
# Push a few things
#
my @elements = (11 .. 20);
foreach my $element (@elements) {
    $stack -> push ($element);
}

for (my $i = 0; $i < @elements; $i ++) {
    my $exp = $elements [- $i - 1];
    my $got = $stack -> top ($i);
    is $got, $exp, "top ($i) returns '$exp'";
}

foreach my $depth ("a", "", undef, 1.24, -1) {
    throws_ok {$stack -> top ($depth)}
              qr /Offsets need to be non-negative integers/,
              "Cannot offset " . (defined ($depth) ? "'$depth'" : "undef")
}


Test::NoWarnings::had_no_warnings () if $r;

done_testing;
