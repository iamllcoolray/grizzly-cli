package Grizzly::Command::algorithm;
use Grizzly -command;
use strict;
use warnings;

sub abstract { "runs a trading algorithm" }

sub description { "Runs a stock trading algorithm." }

sub validate_args {
  my ($self, $opt, $args) = @_;
  $self->usage_error("Need a stock args") unless @$args;
}

sub execute {
  my ($self, $opt, $args) = @_;
}

1;
