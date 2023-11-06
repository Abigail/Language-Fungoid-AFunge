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

sub run_tests ($name, %args) {
    my $stack = Language::Fungoid::AFunge::Stack:: -> new;
    subtest $name => sub {
        #
        # Init the stack
        #
        $stack -> push ($_) foreach @{$args {init} || []};
        my $result = $stack -> dup (exists $args {dup} ? $args {dup} : ());
        is $result, $stack, "dup () returns \$self";
        my $got = [$stack -> __stack__];
        is_deeply $got, $args {exp}, "new stack";
    }
}


run_tests "Duplicate top",
           init => [2, 3, 4],
           exp  => [2, 3, 4, 4];

run_tests "Duplicate one element",
           init => [2, 3, 4],
           dup  =>  1,
           exp  => [2, 3, 4, 4];

run_tests "Nothing happens if we dup 0 elements",
           init => [2, 3, 4],
           dup  =>  0,
           exp  => [2, 3, 4];

run_tests "Duplicating multiple elements",
           init => [2, 3, 4],
           dup  =>  2,
           exp  => [2, 3, 4, 3, 4];

run_tests "Duplicating top from empty stack",
           exp  => [0];

run_tests "Duplicating multiple elements from empty stack",
           dup  =>  3,
           exp  => [0, 0, 0];

run_tests "Duplicating more elements than on the stack",
           init => [2, 3, 4],
           dup  =>  5,
           exp  => [2, 3, 4, 0, 0, 2, 3, 4];

foreach my $depth ("a", "", undef, 1.24, -1) {
    my $stack = Language::Fungoid::AFunge::Stack:: -> new;
    throws_ok {$stack -> dup ($depth)}
              qr /Offsets need to be non-negative integers/,
              "Cannot duplicate " . (defined ($depth) ? "'$depth'" : "undef")
                                  . " elements";
}

Test::NoWarnings::had_no_warnings () if $r;

done_testing;
