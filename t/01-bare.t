use Defaults::Mauke;
use Test::More;

{
	package T;
	sub f { 1 }
}

ok !eval "f T";
ok $@;
like $@, qr/indirect/i;

done_testing;
