package Grizzly::Command::news;
use Grizzly -command;
use strict;
use warnings;

sub abstract { "display stock market news" }

sub description { "Display current stock market news." }

sub validate_args {
  my ($self, $opt, $args) = @_;
  $self->usage_error("No args allowed") if @$args;
}

sub execute {
  my ($self, $opt, $args) = @_;
}

1;
