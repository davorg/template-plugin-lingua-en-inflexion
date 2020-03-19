use ExtUtils::MakeMaker;

my $mm_ver = $ExtUtils::MakeMaker::VERSION;
if ($mm_ver =~ /_/) { # developer release/version
  $mm_ver = eval $mm_ver;
  die $@ if $@;
}

WriteMakefile(
  NAME         => 'Template::Plugin::Lingua::EN::Inflexion',
  VERSION_FROM => 'lib/Template/Plugin/Lingua/EN/Inflexion.pm',
  LICENSE      => 'perl_5',

  PREREQ_PM    => {
    'Lingua::EN::Inflexion' => 0,
    Template                => 0,
  },

  META_MERGE    => {
    'meta-spec' => { version => 2 },
    resources => {
      repository => {
        type => 'git',
        url  => 'https://github.com/davorg/template-plugin-lingua-en-inflexion.git',
        web  => 'https://github.com/davorg/template-plugin-lingua-en-inflexion',
      },
    },
  },
  ($mm_ver >= 6.48
    ? (MIN_PERL_VERSION => 5.006)
    : ()
  ),
);
