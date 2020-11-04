package Oolong;

our $VERSION = '0.1';

use strict;
use warnings;
use diagnostics;

use Carp;
use Try::Tiny;


sub new{
	my ($class,$args) = @_;
	my $self = bless {symbol => $args->{symbol}}, $class;
}


sub get_symbol{
	my $self = shift;
	return $self->{symbol};
}


sub set_symbol{
	my ($self,$symbol) = @_;
	$self->{symbol} = $symbol;
}


sub symbol_o{
	my $self = shift;
	my $symbol = $self->{symbol};
	print $symbol, "\n";
}

1;