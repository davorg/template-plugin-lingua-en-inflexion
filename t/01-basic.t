use strict;
use warnings;

use Test::More;
use Template;

my $tt = Template->new;

my $template = do { local $/; <DATA> };

my @exp = (
  'TEST0: 0 results were found',
  'TEST1: 1 result was found',
  'TEST2: 2 results were found',
);

for (0 .. 2) {
  my $out;
  $tt->process(\$template, { x => $_ }, \$out);

  is($out, $exp[$_]);
}

done_testing();

__DATA__
[% USE Lingua::EN::Inflexion -%]
TEST[% x %]: [% inflect("<#:$x> <N:result> <V:was> found") -%]
