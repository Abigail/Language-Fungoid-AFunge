#!/usr/bin/perl

use 5.028;

use strict;
use warnings;
no  warnings 'syntax';

use if -d    "../lib", "lib",    "../lib";
use if -d "../../lib", "lib", "../../lib";

use Test::More 0.88;

our $r = eval "require Test::NoWarnings; 1";

use Language::Fungoid::AFunge::Program;

my $program = Language::Fungoid::AFunge::Program:: -> new;

isa_ok $program, "Language::Fungoid::AFunge::Program";

#
# Check whether we have the expected methods.
#
can_ok $program, $_ for qw [dimensions width height x_min y_min x_max y_max
                            set_dimensions
                            set_x_min set_y_min set_x_max set_y_max
                            set_cell];

Test::NoWarnings::had_no_warnings () if $r;

done_testing;
