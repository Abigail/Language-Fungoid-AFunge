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

is_deeply [$interpreter -> position], [0, 0], "Initial position";

my $result = $interpreter -> set_position (3, 7);
is $result, $interpreter, "set_position () returns \$self";
is_deeply [$interpreter -> position], [3, 7],
           "position () returns values set by set_position";

Test::NoWarnings::had_no_warnings () if $r;

done_testing;
