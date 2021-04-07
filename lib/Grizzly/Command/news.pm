package Grizzly::Command::news;
use Grizzly -command;
use strict;
use warnings;

sub abstract { "display stock news" }

sub description { "Display current news on a stock." }

sub validate_args {
  my ($self, $opt, $args) = @_;
  $self->usage_error("Need a symbol args") unless @$args;
}

sub execute {
  my ($self, $opt, $args) = @_;
}

1;
