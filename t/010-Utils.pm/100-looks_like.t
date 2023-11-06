#!/usr/bin/perl

use 5.038;

use strict;
use warnings;
no  warnings 'syntax';

use experimental "for_list";

use lib grep {-d} '../lib', '../../lib';

use Test::More 0.88;

our $r = eval "require Test::NoWarnings; 1";

use Language::Fungoid::AFunge::Utils;

my $NONE    = 0;
my $NATURAL = 1 << 0;
my $INTEGER = 1 << 1;
my $BOTH    = $NATURAL | $INTEGER;

my @tests = (
        1    => $BOTH,
       -1    => $INTEGER,
        0    => $BOTH,
     undef  ,=> $NONE,
        1.5  => $NONE,
      400    => $BOTH,
     -400    => $INTEGER,
);

foreach my ($value, $result) (@tests) {
    my $name = defined $value ? "'$value'" : "undef";
    subtest "Value $name" => sub {
        my $exp_n = $result & $NATURAL;
        my $exp_i = $result & $INTEGER;
        my $got_n = looks_like_natural_number $value;
        my $got_i = looks_like_integer        $value;
        ok !($got_n xor $exp_n), $exp_n ?         "looks like a natural number"
                                        : "does not look like a natural number";
        ok !($got_i xor $exp_i), $exp_i ?         "looks like a integer"
                                        : "does not look like a integer";
    }
}

Test::NoWarnings::had_no_warnings () if $r;

done_testing;
