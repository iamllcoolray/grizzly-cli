package Grizzly::Progress::Bar;
use strict;
use warnings;

use Term::Clear ();
use Term::ProgressBar 2.00;
use constant MAX => 100_000;

my $max = MAX;
my $progress = Term::ProgressBar->new({name => 'Grizzly', count => $max, remove => 1});

sub progressbar {
  my ($self) = shift;
  $progress->minor(0);
  my $next_update = 0;

  for (0..$max) {
      my $is_power = 0;
      for (my $i = 0; 2**$i <= $_; $i++) {
          $is_power = 1 if 2**$i == $_;
      }

      $next_update = $progress->update($_) if $_ >= $next_update;
  }
  $progress->update($max) if $max >= $next_update;

  Term::Clear::clear();

}

1;
