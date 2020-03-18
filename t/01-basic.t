use strict;
use warnings;

use Test::More;
use Template;

my $tt = Template->new;

my $template = do { local $/; <DATA> };

my $out;

my $exp = <<END;
TEST0: 0 results were found
TEST1: 1 result was found
TEST2: 2 results were found
END

$tt->process(\$template, undef, \$out);

is($out, $exp);

done_testing();

__DATA__
[% USE Lingua::EN::Inflexion -%]
TEST0: [% inflect('<#:0> <N:result> <V:was> found') %]
TEST1: [% inflect('<#:1> <N:result> <V:was> found') %]
TEST2: [% inflect('<#:2> <N:result> <V:was> found') %]
