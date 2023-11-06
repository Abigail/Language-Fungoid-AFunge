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
        $interpreter -> set_position (@{$args {position}}) if $args {position};
        $interpreter -> set_delta    (@{$args {delta}})    if $args {delta};

        my $result = $interpreter -> step;
        my ($got_x, $got_y) = $interpreter -> position;
        my ($exp_x, $exp_y) = @{$args {exp}};
    
        is $result, $interpreter => "step returns \$self";
        is $got_x,  $exp_x       => "X coordinate after step";
        is $got_y,  $exp_y       => "Y coordinate after step";
    }
}

run_test "First step after program start",
          position => [ 0,  0],
          delta    => [ 1,  0],
          exp      => [ 1,  0];

run_test "Second step",
          exp      => [ 2,  0];

#
# Cardinal directions
#

run_test "Move north",
          position => [ 5,  5],
          delta    => [ 0, -1],
          exp      => [ 5,  4];

run_test "Move east",
          position => [ 5,  5],
          delta    => [ 1,  0],
          exp      => [ 6,  5];

run_test "Move south",
          position => [ 5,  5],
          delta    => [ 0,  1],
          exp      => [ 5,  6];

run_test "Move west",
          position => [ 5,  5],
          delta    => [-1,  0],
          exp      => [ 4,  5];

#
# Diagonal directions
#

run_test "Move northeast",
          position => [ 5,  5],
          delta    => [ 1, -1],
          exp      => [ 6,  4];

run_test "Move southeast",
          position => [ 5,  5],
          delta    => [ 1,  1],
          exp      => [ 6,  6];

run_test "Move southwest",
          position => [ 5,  5],
          delta    => [-1,  1],
          exp      => [ 4,  6];

run_test "Move northwest",
          position => [ 5,  5],
          delta    => [-1, -1],
          exp      => [ 4,  4];

#
# Leap in some other directions
#

run_test "Move like a Knight",
          position => [ 5,  5],
          delta    => [ 1,  2],
          exp      => [ 6,  7];

run_test "Move like a Camel",
          position => [ 5,  5],
          delta    => [ 1, -3],
          exp      => [ 6,  2];

run_test "Move like a Zebra",
          position => [ 5,  5],
          delta    => [-2, -3],
          exp      => [ 3,  2];

#
# Wrapping around
#

run_test "Wrap moving north",
          position => [ 5,  0],
          delta    => [ 0, -1],
          exp      => [ 5,  9];

run_test "Wrap moving east",
          position => [ 9,  5],
          delta    => [ 1,  0],
          exp      => [ 0,  5];

run_test "Wrap moving south",
          position => [ 5,  9],
          delta    => [ 0,  1],
          exp      => [ 5,  0];

run_test "Wrap moving west",
          position => [ 0,  5],
          delta    => [-1,  0],
          exp      => [ 9,  5];

#
# Wrapping around, double speed
#

run_test "Wrap moving north, double speed, no offset",
          position => [ 5,  0],
          delta    => [ 0, -2],
          exp      => [ 5,  8];

run_test "Wrap moving north, double speed, with offset",
          position => [ 5,  1],
          delta    => [ 0, -2],
          exp      => [ 5,  9];

run_test "Wrap moving east, double speed, no offset",
          position => [ 9,  5],
          delta    => [ 2,  0],
          exp      => [ 1,  5];

run_test "Wrap moving east, double speed, with offset",
          position => [ 8,  5],
          delta    => [ 2,  0],
          exp      => [ 0,  5];

run_test "Wrap moving south, double speed, no offset",
          position => [ 5,  9],
          delta    => [ 0,  2],
          exp      => [ 5,  1];

run_test "Wrap moving south, double speed, with offset",
          position => [ 5,  8],
          delta    => [ 0,  2],
          exp      => [ 5,  0];

run_test "Wrap moving west, double speed, no offset",
          position => [ 0,  5],
          delta    => [-2,  0],
          exp      => [ 8,  5];

run_test "Wrap moving west, double speed, with offset",
          position => [ 1,  5],
          delta    => [-2,  0],
          exp      => [ 9,  5];


Test::NoWarnings::had_no_warnings () if $r;

done_testing;
