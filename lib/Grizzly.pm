package Grizzly;
# ABSTRACT: Grizzly - A command-line interface for looking up stock quote.

our $VERSION = '0.103';

use strict;
use warnings;

use App::Cmd::Setup -app;
1;

=encoding utf8

=head1 NAME

Grizzly - A command-line interface for looking up stock quote.

=head1 DESCRIPTION

Grizzly will output the stock quote of the given symbol.

=head1 SYNOPSIS

    grizzly [options]

    Options:

    news [stock symbol]

    quote [stock symbol]

    help

    version

=head2 Options

news - Displays the stock news of a given symbol.

quote - Displays the stock quote of a given symbol.

help - Displays a help message on how to use Grizzly.

version - Displays Grizzly's version number.

=head1 Setup

=head2 Installation

    cpanm Grizzly

=head2 API Key

You will need to get a free API key from L<NewsAPI|https://newsapi.org/>. Afterwards you will need to set the NEWS_API_KEY environment variable to the API key.

=head1 AUTHOR

Nobunaga <nobunaga@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2021 by Nobunaga.

MIT License
 