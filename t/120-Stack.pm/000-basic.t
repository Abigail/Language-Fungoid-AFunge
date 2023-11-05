#!/usr/bin/perl

use 5.028;

use strict;
use warnings;
no  warnings 'syntax';

use if -d    "../lib", "lib",    "../lib";
use if -d "../../lib", "lib", "../../lib";

use Test::More 0.88;

our $r = eval "require Test::NoWarnings; 1";

use Language::Fungoid::AFunge::Stack;

my $stack = Language::Fungoid::AFunge::Stack:: -> new;

isa_ok $stack, "Language::Fungoid::AFunge::Stack";

#
# Check whether we have the expected methods.
#
can_ok $stack, $_ for qw [push pop top];

Test::NoWarnings::had_no_warnings () if $r;

done_testing;