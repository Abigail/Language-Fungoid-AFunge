use 5.038;
use strict;
use warnings;
no  warnings 'syntax';
use experimental 'class';

class Language::Fungoid::AFunge::Interpreter 2023092601;

use Scalar::Util 'reftype';

field $X  = 0;
field $Y  = 0;
field $dX = 1;
field $dY = 0;
field $program : param;

ADJUST {
    die "program is not a Language::Fungoid::AFunge::Program"
         unless  $program              &&
         reftype $program eq "OBJECT"  &&
                 $program -> isa ("Language::Fungoid::AFunge::Program");
}

method position () {$X,  $Y}
method delta    () {$dX, $dY}

method set_position ($x, $y) {
    ($X, $Y) = ($x, $y);
    $self;
}
method set_delta ($dx, $dy) {
    ($dX, $dY) = ($dx, $dy);
    $self;
}


__END__

=head1 NAME

Language::Fungoid::AFunge - Abstract

=head1 SYNOPSIS

=head1 DESCRIPTION

=head1 BUGS

=head1 TODO

=head1 SEE ALSO

=head1 DEVELOPMENT

The current sources of this module are found on github,
L<< git://github.com/Abigail/Language-Fungoid-AFunge.git >>.

=head1 AUTHOR

Abigail, L<< mailto:cpan@abigail.freedom.nl >>.

=head1 COPYRIGHT and LICENSE

Copyright (C) 2023 by Abigail.

Permission is hereby granted, free of charge, to any person obtaining a
copy of this software and associated documentation files (the "Software"),   
to deal in the Software without restriction, including without limitation
the rights to use, copy, modify, merge, publish, distribute, sublicense,
and/or sell copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included
in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
THE AUTHOR BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT
OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

=head1 INSTALLATION

To install this module, run, after unpacking the tar-ball, the 
following commands:

   perl Makefile.PL
   make
   make test
   make install

=cut
