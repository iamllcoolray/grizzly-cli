use Test::More;

use v5.36;
use Config::INI::Reader;

use Grizzly;

my $newest_version = '0.111';

my $config_hash     = Config::INI::Reader->read_file('dist.ini');
my $config_version  = $config_hash->{_}->{version};
my $changes_version = '';

my $changes_file = 'CHANGES';
open( FH, $changes_file ) or die $!;
my @changes_arr = <FH>;

foreach my $changes_arr (@changes_arr) {
    if ( $changes_arr =~ /\b$newest_version\b/ ) {
        $changes_version = $newest_version;
        last;
    }
}

is( $Grizzly::VERSION, $newest_version,
    'checking if $Grizzly::VERSION is equal to $newest_version' );
is( $config_version, $newest_version,
    'checking if $config_version equal is to $newest_version' );
is( $changes_version, $newest_version,
    'checking if $changes_version equal is to $newset_versionc' );

close(FH);

done_testing();
