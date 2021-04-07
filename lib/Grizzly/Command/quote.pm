package Grizzly::Command::quote;
use Grizzly -command;
use strict;
use warnings;

sub abstract { "display stock quote" }

sub description { "Display the stock quote information." }

sub validate_args {
  my ($self, $opt, $args) = @_;
  $self->usage_error("Need a symbol args") unless @$args;
}

sub execute {
  my ($self, $opt, $args) = @_;
}

1;
