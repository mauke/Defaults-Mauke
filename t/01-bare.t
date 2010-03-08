use Defaults::Mauke;
use Test::More;

fun foo($x) {
	$x
}

ok foo 1;
ok !foo 0;

done_testing;
