package Defaults::Mauke;

use warnings;
use strict;
use utf8;

no indirect;  # beware bugs/segfaults
use Function::Parameters ();  # suckage hopefully fixed

our $VERSION = '0.07';

sub _croak {
	require Carp;
	{
		no warnings qw(redefine);
		*_croak = \&Carp::croak;
	}
	goto &_croak;
}

sub _indir {
	my ($obj, $meth) = @_;
	_croak qq{Indirect call of method "$meth" on object "$obj"};
}

sub import {
	my ($class, @args) = @_;
	my $caller = caller;
	
	_croak qq{"$_" is not exported by the $class module} for @args;
	
	strict->import;
	warnings->import;
	warnings->unimport(qw[recursion qw]);
	utf8->import;
	indirect->unimport(hook => \&_indir);
	Function::Parameters::import_into $caller;
}

1

__END__

=head1 NAME

Defaults::Mauke - load a few generally useful modules to save typing

=head1 SYNOPSIS

 use Defaults::Mauke;
 
 ## equivalent to
 # use strict;
 # use warnings;
 # no warnings qw[recursion qw];
 # use utf8;
 # no indirect;
 # use Function::Parameters;

=head1 DESCRIPTION

I got tired of starting every Perl file I write with loading the same two or three
modules, so I wrote another module that does it for me. If you happen to like the
same set of default modules, feel free to use it; if you don't, maybe you can copy
and adapt the source.

=head1 SEE ALSO

L<strict>, L<warnings>, L<utf8>, L<perllexwarn>, L<indirect>, L<Function::Parameters>.

=head1 AUTHOR

Lukas Mai, C<< <l.mai at web.de> >>

=head1 LICENSE

I put this code in the public domain. Do whatever you want with it.

=cut
