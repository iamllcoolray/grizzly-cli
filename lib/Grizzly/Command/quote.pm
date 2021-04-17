package Grizzly::Command::quote;
use Grizzly -command;
use strict;
use warnings;

use Finance::Quote;
use Term::Clear ();
use Term::ProgressBar 2.00;
use constant MAX => 100_000;

my $q = Finance::Quote->new("YahooJSON");
my $progress = Term::ProgressBar->new(MAX);

sub abstract { "display stock quote" }

sub description { "Display the stock quote information." }

sub validate_args {
  my ($self, $opt, $args) = @_;
  $self->usage_error("Need a symbol args") unless @$args;
}

sub execute {
  my ($self, $opt, $args) = @_;

  quote_info(@$args);
}

sub quote_info {
  my ($symbol) = @_;

  my %quote = $q->yahoo_json($symbol);

  for (0..MAX) {
      my $is_power = 0;
      for (my $i = 0; 2**$i <= $_; $i++) {
          $is_power = 1 if 2**$i == $_;
      }

      $progress->update($_);
  }

  Term::Clear::clear();

  my $name = $quote {$symbol, "name"};
  my $date = $quote {$symbol, "date"};
  my $last_price = $quote {$symbol, "last"};
  my $open = $quote {$symbol, "open"};
  my $high = $quote {$symbol, "high"};
  my $low = $quote {$symbol, "low"};
  my $close = $quote {$symbol, "close"};
  my $div_yield = $quote {$symbol, "div_yield"};
  my $pe = $quote {$symbol, "pe"};
  my $eps = $quote {$symbol, "eps"};

  unless ($name) {
    $name = $symbol;
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

print <<EOF,

Grizzly - Stock Quote Analysis

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
