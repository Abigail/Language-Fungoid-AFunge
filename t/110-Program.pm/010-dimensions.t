#!/usr/bin/perl

use 5.028;

use strict;
use warnings;
no  warnings 'syntax';

use experimental 'signatures';

use if -d    "../lib", "lib",    "../lib";
use if -d "../../lib", "lib", "../../lib";

use Test::More 0.88;

our $r = eval "require Test::NoWarnings; 1";

use Language::Fungoid::AFunge::Program;

my $program = Language::Fungoid::AFunge::Program:: -> new;

sub run_tests ($name, $program, $x_min, $y_min, $x_max, $y_max,
                                $update = "dimensions", $cell = []) {
    subtest $name => sub {
        if ($update) {
            my $r;
            $r = $program -> set_dimensions ($x_min, $y_min, $x_max, $y_max) 
                             if $update eq "dimensions";
            $r = $program -> set_x_min ($x_min) if $update eq "x_min";
            $r = $program -> set_y_min ($y_min) if $update eq "y_min";
            $r = $program -> set_x_max ($x_max) if $update eq "x_max";
            $r = $program -> set_y_max ($y_max) if $update eq "y_max";
            $r = $program -> set_cell  (@$cell) if $update eq "cell";
            is $r, $program, "set_${update} returns \$self";
        }
        is         $program -> x_min,        $x_min,  "x_min ()";
        is         $program -> y_min,        $y_min,  "y_min ()";
        is         $program -> x_max,        $x_max,  "x_max ()";
        is         $program -> y_max,        $y_max,  "y_max ()";
        is_deeply [$program -> dimensions], [$x_min,  $y_min,
                                             $x_max,  $y_max], "dimensions ()";
        is         $program -> width,        $x_max - $x_min, "width  ()";
        is         $program -> height,       $y_max - $y_min, "height ()";
    }
}


run_tests "After initialization",   $program, 0, 0, 1, 1;
run_tests "Setting all dimensions", $program, 3, 4, 5, 8, "dimensions";
run_tests "Setting x_min",          $program, 1, 4, 5, 8, "x_min";
run_tests "Setting y_min",          $program, 1, 2, 5, 8, "y_min";
run_tests "Setting x_max",          $program, 1, 2, 7, 8, "x_max";
run_tests "Setting y_max",          $program, 1, 2, 7, 9, "y_max";

$program -> set_dimensions (3, 3, 7, 7);

run_tests "Add cell not out of bounds", $program, 3, 3, 7, 7, "cell", [5, 5];
run_tests "Add cell below",             $program, 3, 3, 7, 9, "cell", [5, 8];
run_tests "Add cell above",             $program, 3, 1, 7, 9, "cell", [5, 1];
run_tests "Add cell to the left",       $program, 1, 1, 7, 9, "cell", [1, 5];
run_tests "Add cell to the right",      $program, 1, 1, 9, 9, "cell", [8, 5];

Test::NoWarnings::had_no_warnings () if $r;

done_testing;
