package Grizzly::Data::StockInfo;

# ABSTRACT: Gets and returns stock quote

use v5.36;
use parent qw(Exporter);

use Finance::Quote;

require Exporter;
our @ISA    = ("Exporter");
our @EXPORT = qw(stock_info);

my $q = Finance::Quote->new("YahooJSON");

sub stock_info ($symbol) {

    return $q->yahoo_json($symbol);
}

1;
