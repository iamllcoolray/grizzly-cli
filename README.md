# NAME

Grizzly - A command-line interface for looking up stock quote.

## DESCRIPTION

Grizzly will output the stock quote of the given symbol.

## SYNOPSIS

```bash
grizzly [options]

    Options:

        news [stock symbol]
        quote [stock symbol]
        help
        version
```

### Options

news - Displays the stock news of a given symbol.

quote - Displays the stock quote of a given symbol.

help - Displays a help message on how to use Grizzly.

version - Displays Grizzly's version number.

## Setup

### Installation

#### Through cpanm

```bash
cpanm Grizzly
```

#### Through the Project Directory

```bash
cpanm --installdeps .
perl Makefile.PL
make
make install
```

### API Key

You will need to get a free API key from [NewsAPI](https://newsapi.org/). Afterwards you will need to set the NEWS\_API\_KEY environment variable to the API key.

## AUTHOR

Nobunaga <nobunaga@cpan.org>

## COPYRIGHT AND LICENSE

This software is copyright (c) 2022 by Nobunaga.

MIT License
