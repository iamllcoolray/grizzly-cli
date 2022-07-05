package Grizzly::Command::quote;

# ABSTRACT: Gets a stock quote for the given symbol

use Grizzly -command;
use v5.36;

use Grizzly::Data::Finance qw(quote_info);

sub command_names { qw(quote --quote -q) }

sub abstract { "display stock quote" }

sub description { "Display the stock quote information." }

sub validate_args ( $self, $opt, $args ) {
    $self->usage_error("Need a symbol args") unless @$args;
}

sub execute ( $self, $opt, $args ) {

    quote_info(@$args);
}

1;

=encoding utf8

=head1 DESCRIPTION

Grizzly will output the stock quote of the inputted tickers symbol.

=head1 SYNOPSIS

    grizzly quote [stock symbol]
