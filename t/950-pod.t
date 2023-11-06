#!/usr/bin/perl

use 5.038;

use strict;
use warnings;
no  warnings 'syntax';

use lib grep {-d} '../lib', '../../lib';

use Test::More;

unless ($ENV {AUTHOR_TESTING}) {
    plan skip_all => "AUTHOR tests";
    exit;
}

eval "use Test::Pod 1.00; 1" or
      plan skip_all => "Test::Pod required for testing POD";

all_pod_files_ok ();


__END__
