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


Test::NoWarnings::had_no_warnings () if $r;

done_testing;
