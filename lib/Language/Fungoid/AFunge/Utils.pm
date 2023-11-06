use 5.038;
use strict;
use warnings;
no  warnings 'syntax';

package Language::Fungoid::AFunge::Utils 2023092601;

################################################################################
#
# Some utility programs.
#
################################################################################

use Exporter ();

our @ISA    = qw [Exporter];
our @EXPORT = qw [looks_like_integer looks_like_natural_number];

use Scalar::Util qw [looks_like_number];

################################################################################
#
# looks_like_natural_number ($n)
#
# Return true iff $n is a natural number (0, 1, 2, ...)
#
################################################################################

sub looks_like_natural_number ($n) {
    defined ($n) && looks_like_number ($n) && int ($n) == $n && $n >= 0
}


################################################################################
#
# looks_like_integer ($i)
#
# Return true iff $n is an integer (..., -2, -1, 0, 1, 2, ...)
#
################################################################################

sub looks_like_integer ($i) {
    defined ($i) && looks_like_number ($i) && int ($i) == $i
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
