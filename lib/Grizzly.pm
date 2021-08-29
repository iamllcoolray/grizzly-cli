package Grizzly;
# ABSTRACT: Grizzly - A command-line interface for looking up stock quote.

our $VERSION = '0.001';

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

    quote [stock symbol]

    help

    version

=head2 Options

quote - Displays the stock quote of a given symbol.

help - Displays a help message on how to use Grizzly.

version - Displays Grizzly's version number.

=head1 AUTHOR

Nobunaga <nobunaga@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2021 by Nobunaga.

MIT License
 