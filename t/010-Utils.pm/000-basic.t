#!/usr/bin/perl

use 5.028;

use strict;
use warnings;
no  warnings 'syntax';

use if -d    "../lib", "lib",    "../lib";
use if -d "../../lib", "lib", "../../lib";

use Test::More 0.88;

our $r = eval "require Test::NoWarnings; 1";

BEGIN {
    use_ok "Language::Fungoid::AFunge::Utils";
}

#
# Check whether the expected subroutines have been exported
#
foreach my $sub (qw [looks_like_natural_number looks_like_integer]) {
    subtest "$sub ()" => sub {
        no strict 'refs';
        ok defined &{"Language::Fungoid::AFunge::Utils::$sub"}, "exists";
        ok defined &{"::$sub"}, "exported";
    }
}

Test::NoWarnings::had_no_warnings () if $r;

done_testing;
