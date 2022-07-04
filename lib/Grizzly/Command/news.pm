package Grizzly::Command::news;

# ABSTRACT: Gets the stock news for the given symbol

use Grizzly -command;
use v5.36;

use Grizzly::Data::Article qw(news_info);

sub command_names { qw(news --news -n) }

sub abstract { "display stock news" }

sub description { "Display the any news on the stock." }

sub validate_args ( $self, $opt, $args ) {
    $self->usage_error("Need a symbol args") unless @$args;
}

sub execute ( $self, $opt, $args ) {

    news_info(@$args);
}

1;

=encoding utf8

=head1 NAME

Grizzly::Command::news

=head1 DESCRIPTION

The news feture will output stock in formation on the inputted ticker symbol.

=head1 SYNOPSIS

    grizzly news [stock symbol]

=head1 API Key

You will need to get a free API key from L<NewsAPI|https://newsapi.org/>. Afterwards you will need to set the NEWS_API_KEY environment variable to the API key.

=head1 AUTHOR

Nobunaga <nobunaga@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2021 by Nobunaga.

MIT License
