#!/usr/bin/perl

use 5.038;

use strict;
use warnings;
no  warnings 'syntax';

use lib grep {-d} '../lib', '../../lib';

use Test::More 0.88;

our $r = eval "require Test::NoWarnings; 1";

my $base = "Language::Fungoid::AFunge";

my @modules = map {$base . $_}
             (map {"::$_"} qw [Program Interpreter]), "";

foreach my $module (@modules) {
    use_ok ($module) or BAIL_OUT ("Loading of '$module' failed");
    no strict 'refs';
    ok ${"${module}::VERSION"}, "\$${module}::VERSION set";
}

Test::NoWarnings::had_no_warnings () if $r;

done_testing;
