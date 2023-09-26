#!/usr/bin/perl

use 5.010;

use strict;
use warnings;
no  warnings 'syntax';

use Test::More 0.88;

our $r = eval "require Test::NoWarnings; 1";

BEGIN {
    use_ok ('Language::Fungoid::AFunge') or
        BAIL_OUT ("Loading of 'Language::Fungoid::AFunge' failed");
}

ok defined $Language::Fungoid::AFunge::VERSION, "VERSION is set";

Test::NoWarnings::had_no_warnings () if $r;

done_testing;
