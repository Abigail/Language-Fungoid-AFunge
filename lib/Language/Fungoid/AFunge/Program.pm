use 5.038;
use strict;
use warnings;
no  warnings 'syntax';
use experimental 'class';

class Language::Fungoid::AFunge::Program 2023092601;

################################################################################
#
# Dimensions of the program. This can be increased during the run
# of the program.
#
################################################################################

field $x_min = 0;
field $y_min = 0;
field $x_max = 1;
field $y_max = 1;

#
# Getters
#
method dimensions () {$x_min, $y_min, $x_max, $y_max}
method x_min      () {$x_min}
method y_min      () {$y_min}
method x_max      () {$x_max}
method y_max      () {$y_max}
method width      () {$x_max - $x_min}
method height     () {$y_max - $y_min}

#
# Setters
#
method set_dimensions  ($x_min, $y_min, $x_max, $y_max) {
    $self -> set_x_min ($x_min)
          -> set_y_min ($y_min)
          -> set_x_max ($x_max)
          -> set_y_max ($y_max)
}
           
method set_x_min ($in) {$x_min = $in; $self}
method set_y_min ($in) {$y_min = $in; $self}
method set_x_max ($in) {$x_max = $in; $self}
method set_y_max ($in) {$y_max = $in; $self}

method set_cell ($x, $y, $value = ' ') {
    $x_min = $x     if $x <  $x_min;
    $y_min = $y     if $y <  $y_min;
    $x_max = $x + 1 if $x >= $x_max;
    $y_max = $y + 1 if $y >= $y_max;
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
