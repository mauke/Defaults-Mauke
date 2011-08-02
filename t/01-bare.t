use Defaults::Mauke;
use Test::More;

fun foo($x, $y) {
	$x * 2 + $y
}

{
	package T;
	sub f { 1 }
}

ok !eval "f T";
ok $@;
like $@, qr/indirect/i;

ok !eval "\$x";
ok $@;
like $@, qr/^Global symbol "\$x" requires explicit package name/;

is foo(20, 2), 42;

done_testing;
