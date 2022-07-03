package Grizzly::Progress::Bar;

# ABSTRACT: Runs a progress bar when called

use v5.36;
use parent qw(Exporter);

use Term::Clear ();
use Term::ProgressBar 2.00;
use constant MAX => 100_000;

require Exporter;
our @ISA = ("Exporter");

our @EXPORT = qw(progressbar);

sub progressbar {
    my ($self) = @_;

    my $max      = MAX;
    my $progress = Term::ProgressBar->new(
        { name => 'Grizzly', count => $max, remove => 1, silent => 0, } );

    $progress->minor(0);
    my $next_update = 0;

    for ( 0 .. $max ) {
        my $is_power = 0;
        for ( my $i = 0 ; 2**$i <= $_ ; $i++ ) {
            $is_power = 1 if 2**$i == $_;
        }

        $next_update = $progress->update($_) if $_ >= $next_update;
    }
    $progress->update($max) if $max >= $next_update;

    Term::Clear::clear();

}

1;

=encoding utf8

=head1 NAME

Grizzly::Progress::Bar

=head1 DESCRIPTION

Outputs a progress bar so the user can visually see Grizzly gather the stock information.

=head1 AUTHOR

Nobunaga <nobunaga@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2021 by Nobunaga.

MIT License
