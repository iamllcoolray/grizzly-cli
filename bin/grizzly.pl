#!/usr/bin/perl
# ABSTRACT: Grizzly application script
# PODNAME: Grizzly

use strict;
use warnings;

use FindBin qw($Bin);
use lib "$Bin/../lib";
use Grizzly;

my %arg =(
  show_version_cmd => 1,
);
my $cmd = Grizzly->new(\%arg);
$cmd->run;
