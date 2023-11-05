#!/usr/bin/perl

use 5.028;

use strict;
use warnings;
no  warnings 'syntax';

use if -d    "../lib", "lib",    "../lib";
use if -d "../../lib", "lib", "../../lib";

use Test::More 0.88;

our $r = eval "require Test::NoWarnings; 1";

use Language::Fungoid::AFunge::Interpreter;
use Language::Fungoid::AFunge::Program;

my $program     = Language::Fungoid::AFunge::Program::     -> new;
my $interpreter = Language::Fungoid::AFunge::Interpreter:: -> new
                                                  (program => $program);

isa_ok $interpreter, "Language::Fungoid::AFunge::Interpreter";

#
# Check whether we have the expected methods.
#
can_ok $interpreter, $_ for qw [position set_position delta set_delta];

Test::NoWarnings::had_no_warnings () if $r;

done_testing;
