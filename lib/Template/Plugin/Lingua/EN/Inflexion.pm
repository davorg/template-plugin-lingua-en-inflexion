package Template::Plugin::Lingua::EN::Inflexion;

use parent 'Template::Plugin';

use Lingua::EN::Inflexion;

sub new {
  my ($class, $context) = @_;

  $context->stash->set(inflect => \&Lingua::EN::Inflexion::inflect);

  return bless { _CONTEXT => $context }, $class;
}

1;
