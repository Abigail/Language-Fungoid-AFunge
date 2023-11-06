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

is_deeply [$interpreter -> delta], [1, 0], "Initial delta";

my $result = $interpreter -> set_delta (2, -1);
is $result, $interpreter, "set_delta () returns \$self";
is_deeply [$interpreter -> delta], [2, -1],
           "delta () returns values set by set_delta";

Test::NoWarnings::had_no_warnings () if $r;

done_testing;
