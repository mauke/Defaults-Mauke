use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'Defaults::Mauke',
    AUTHOR              => q{Lukas Mai <l.mai@web.de>},
    VERSION_FROM        => 'lib/Defaults/Mauke.pm',
    ABSTRACT_FROM       => 'lib/Defaults/Mauke.pm',
    ($ExtUtils::MakeMaker::VERSION >= 6.3002
      ? ('LICENSE'=> 'unrestricted')
      : ()),
    PL_FILES            => {},
    BUILD_REQUIRES => {
        'Test::More' => 0,
    },
    PREREQ_PM => {
        'warnings' => 0,
        'strict' => 0,
        'utf8' => 0,
        'indirect' => '0.16',
        'bareword::filehandles' => 0,
        'Function::Parameters' => '0.06',
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'Defaults-Mauke-*' },
);
