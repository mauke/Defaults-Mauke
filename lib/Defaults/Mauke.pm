package Defaults::Mauke;

use warnings;
use strict;
use utf8;

no bareword::filehandles;
no indirect 0.16;
use Function::Parameters 0.06 ();  # require the lexical pragma version

use Carp qw(croak);

*VERSION = \'0.09';

sub import {
    my ($class, @args) = @_;
    my $caller = caller;

    croak qq{"$_" is not exported by the $class module} for @args;

    strict->import;
    warnings->import;
    warnings->unimport(qw[recursion qw]);
    utf8->import;
    bareword::filehandles->unimport;
    indirect->unimport(':fatal');
    Function::Parameters->import(
        Function::Parameters->VERSION >= 0.07
            ? {
                fun => 'function_strict',
                method => 'method_strict',
            }
            : ()
    );
}

1

__END__

=encoding UTF-8

=head1 NAME

Defaults::Mauke - load mauke's favorite modules

=head1 SYNOPSIS

 use Defaults::Mauke;
 
 ## equivalent to
 # use strict;
 # use warnings; no warnings qw[recursion qw];
 # use utf8;
 # no bareword::filehandles;
 # no indirect qw(:fatal);
 ## if we have Function::Parameters v0.07:
 # use Function::Parameters { fun => "function_strict", method => "method_strict" };
 ## otherwise:
 # use Function::Parameters;

=head1 DESCRIPTION

I got tired of starting every Perl file I write with loading the same two or three
modules, so I wrote another module that does it for me. If you happen to like the
same set of default modules, feel free to use it; if you don't, maybe you can copy
and adapt the source.

=head1 SEE ALSO

L<strict>, L<warnings>, L<utf8>, L<perllexwarn>, L<bareword::filehandles>,
L<indirect>, L<Function::Parameters>.

=head1 AUTHOR

Lukas Mai, C<< <l.mai at web.de> >>

=head1 LICENSE

I put this code in the public domain. Do whatever you want with it.

=cut
