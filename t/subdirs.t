use strict;
use warnings;

use Test::More;
use Text::Gitignore qw(match_gitignore);

subtest 'match whole dir' => sub {
    my (@matched) = match_gitignore( ['bin/'], 'bin/', 'bin/foo' );

    is_deeply \@matched, ['bin/', 'bin/foo'];
};

subtest 'not match file' => sub {
    my (@matched) = match_gitignore( ['bin/'], 'bin' );

    is_deeply \@matched, [];
};

subtest 'match whole dir without trailing slash' => sub {
    my (@matched) = match_gitignore( ['bin'], 'bin/', 'bin/foo' );

    is_deeply \@matched, ['bin/', 'bin/foo'];
};

subtest 'also match file without trailing slash' => sub {
    my (@matched) = match_gitignore( ['bin'], 'bin' );

    is_deeply \@matched, ['bin'];
};

done_testing;
