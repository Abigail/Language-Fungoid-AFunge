#!/usr/bin/perl

use 5.038;

use strict;
use warnings;
no  warnings 'syntax';

use lib grep {-d} '../lib', '../../lib';

use Test::More 0.88;

our $r = eval "require Test::NoWarnings; 1";

use Language::Fungoid::AFunge::Interpreter;
use Language::Fungoid::AFunge::Program;

my $program     = Language::Fungoid::AFunge::Program::     -> new;
my $interpreter = Language::Fungoid::AFunge::Interpreter:: -> new
                                                  (program => $program);

$program     -> set_dimensions (0, 0, 10, 10);

sub run_test ($name, %args) {
    subtest $name => sub {
        foreach my $method (qw [turn_right turn_left flip]) {
            next unless $args {$method};
            subtest $method => sub {
                $interpreter -> set_delta (@{$args {delta}});

                my $result = $interpreter -> $method;
                my ($got_dx, $got_dy) = $interpreter -> delta;
                my ($exp_dx, $exp_dy) = @{$args {$method}};
    
                is $result, $interpreter => "$method returns \$self";
                is $got_dx,  $exp_dx     => "dX after $method";
                is $got_dy,  $exp_dy     => "dY after $method";
            }
        }
    }
}


#
# Cardinal directions
#

run_test "Move north",
          delta      => [ 0, -1],
          turn_right => [ 1,  0],
          turn_left  => [-1,  0],
          flip       => [ 0,  1];

run_test "Move east",
          delta      => [ 1,  0],
          turn_right => [ 0,  1],
          turn_left  => [ 0, -1],
          flip       => [-1,  0];

run_test "Move south",
          delta      => [ 0,  1],
          turn_right => [-1,  0],
          turn_left  => [ 1,  0],
          flip       => [ 0, -1];

run_test "Move west",
          delta      => [-1,  0],
          turn_right => [ 0, -1],
          turn_left  => [ 0,  1],
          flip       => [ 1,  0];

#
# Some other directions
#

run_test "Knight's move",
          delta      => [ 2,  1],
          turn_right => [-1,  2],
          turn_left  => [ 1, -2],
          flip       => [-2, -1];



Test::NoWarnings::had_no_warnings () if $r;

done_testing;
