package Grizzly::Command::quote;
use Grizzly -command;
use strict;
use warnings;

use Finance::Quote;

my $q = Finance::Quote->new("YahooJSON");

sub abstract { "display stock quote" }

sub description { "Display the stock quote information." }

sub validate_args {
  my ($self, $opt, $args) = @_;
  $self->usage_error("Need a symbol args") unless @$args;
}

sub execute {
  my ($self, $opt, $args) = @_;

  my %quote = $q->yahoo_json(@$args);

  my $name = $quote {@$args, "name"};
  my $date = $quote {@$args, "date"};
  my $last_price = $quote {@$args, "last"};
  my $open = $quote {@$args, "open"};
  my $high = $quote {@$args, "high"};
  my $low = $quote {@$args, "low"};
  my $close = $quote {@$args, "close"};
  my $div_yield = $quote {@$args, "div_yield"};
  my $pe = $quote {@$args, "pe"};
  my $eps = $quote {@$args, "eps"};

  unless ($name) {
    $name = @$args;
  }
  unless ($date) {
    $date = 'n/a';
  }
  unless ($last_price) {
    $last_price = 'n/a';
  }
  unless ($open) {
    $open = 'n/a';
  }
  unless ($high) {
    $high = 'n/a';
  }
  unless ($low) {
    $low = 'n/a';
  }
  unless ($close) {
    $close = 'n/a';
  }
  unless ($div_yield) {
    $div_yield = 'n/a';
  }
  unless ($pe) {
    $pe = 'n/a';
  }
  unless ($eps) {
    $eps = 'n/a';
  }


  print "Company: ", $name,
  "\n",
  "Date: ", $date,
  "\n",
  "Latest Price: ", $last_price,
  "\n",
  "Open: ", $open,
  "\n",
  "High: ", $high,
  "\n",
  "Low: ", $low,
  "\n",
  "Previous Close: ", $close,
  "\n",
  "Dividend Yield: ", $div_yield,
  "\n",
  "P/E Ratio: ", $pe,
  "\n",
  "EPS: ", $eps,
  "\n";
}

1;
