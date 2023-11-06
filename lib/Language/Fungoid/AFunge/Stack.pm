use 5.038;
use strict;
use warnings;
no  warnings 'syntax';
use experimental 'class';

class Language::Fungoid::AFunge::Stack 2023110501;

use Language::Fungoid::AFunge::Utils qw [looks_like_natural_number
                                         looks_like_integer];

################################################################################
#
# This implements a stack used by the interpreters. Note that instances
# of this class are elements of the stack of stacks used by the interpreters.
#
################################################################################

field $stack = [];

################################################################################
#
# method push ($element)
# method pop ()
# 
# Standard push/pop method of a stack.
#
# We can only push integers on the stack. Furthermore, a stack is assumed
# to contain an unlimited amount of 0's before anything is pushed on it.
# Which means we return 0 from a traditionally empty stack.
#
################################################################################

method push ($element) {
    die "Only integers can be pushed on a stack"
         unless looks_like_integer ($element);
    push @$stack => $element;
    $self
}
method pop () {
    @$stack ? pop @$stack : 0
}


################################################################################
#
# method top ($self, $depth = 0)
#
# Return the top level element of a stack. If $depth is given, return the
# element this many places from the top. If the stack is empty, of $depth
# exceeds the number of pushed elements on the stack, return 0
#
################################################################################

method top ($depth = 0) {
    die "Offsets need to be non-negative integers"
         unless looks_like_natural_number $depth;
    $depth < @$stack ? $$stack [- $depth - 1] : 0;
}


################################################################################
#
# method dup ($self, $amount = 1)
#
# Duplicates the $amount (defaults to 1) top level elements of the stack,
# keeping the order. If $amount exceeds to number of elements pushed,
# add as many 0's as needed.
#
################################################################################

method dup ($amount = 1) {
    die "Offsets need to be non-negative integers"
         unless looks_like_natural_number $amount;
    if ($amount) {
        my @new;
        if ($amount > @$stack) {
            @new = ((0) x ($amount - @$stack), @$stack);
        }
        else {
            @new = @$stack [- $amount .. - 1];
        }
        push @$stack => @new;
    }
    $self;
}

################################################################################
#
# method __stack__ ()
#
# Returns the entire stack. For debugging/testing only.
#
################################################################################

method __stack__ () {
    die "__stack__ is only available when testing" unless $0 =~ /\.t$/;
    return @$stack;
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
