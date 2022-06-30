package Grizzly::Command::quote;

# ABSTRACT: Gets a stock quote for the given symbol

use Grizzly -command;
use strict;
use warnings;

use Finance::Quote;
use Grizzly::Progress::Bar;
use Term::ANSIColor;

my $q = Finance::Quote->new("YahooJSON");

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

sub quote_info {
    my ($symbol) = @_;

    my %quote = $q->yahoo_json($symbol);

    Grizzly::Progress::Bar->progressbar();

    my $name       = $quote{ $symbol, "name" }      || 'n/a';
    my $date       = $quote{ $symbol, "date" }      || 'n/a';
    my $last_price = $quote{ $symbol, "last" }      || 'n/a';
    my $open       = $quote{ $symbol, "open" }      || 'n/a';
    my $high       = $quote{ $symbol, "high" }      || 'n/a';
    my $low        = $quote{ $symbol, "low" }       || 'n/a';
    my $close      = $quote{ $symbol, "close" }     || 'n/a';
    my $div_yield  = $quote{ $symbol, "div_yield" } || 'n/a';
    my $pe         = $quote{ $symbol, "pe" }        || 'n/a';
    my $eps        = $quote{ $symbol, "eps" }       || 'n/a';

    my $title = colored( "Grizzly - Stock Quote Analysis", "blue" );

    print <<EOF,;

$title

Company: ========== $name
Date: ============= $date
Latest Price: ===== $last_price
Open: ============= $open
High: ============= $high
Low: ============== $low
Previous Close: === $close
Dividend Yield: === $div_yield
P/E Ratio: ======== $pe
EPS: ============== $eps

EOF
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
