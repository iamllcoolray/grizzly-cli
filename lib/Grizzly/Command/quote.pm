package Grizzly::Command::quote;

# ABSTRACT: Gets a stock quote for the given symbol

use Grizzly -command;
use v5.36;

use Grizzly::Data::Finance qw(quote_info);

sub command_names { qw(quote --quote -q) }

sub abstract { "display stock quote" }

sub description { "Display the stock quote information." }

sub validate_args {
    my ( $self, $opt, $args ) = @_;
    $self->usage_error("Need a symbol args") unless @$args;
}

sub execute {
    my ( $self, $opt, $args ) = @_;

    quote_info(@$args);
}

1;

=encoding utf8

=head1 NAME

Grizzly::Command::quote

=head1 DESCRIPTION

Grizzly will output the stock quote of the inputted tickers symbol.

=head1 SYNOPSIS

    grizzly quote [stock symbol]

=head1 AUTHOR

Nobunaga <nobunaga@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2021 by Nobunaga.

MIT License
