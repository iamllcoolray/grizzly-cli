use Test::More;
use App::Cmd::Tester;

use v5.36;
use Grizzly;

my $result = test_app( Grizzly => [qw(news ibm)] );
isnt( $result->output, '', 'gives an output for ibm news info' );

my $result = test_app( Grizzly => [qw(news msft)] );
isnt( $result->output, '', 'gives an output for msft news info' );

my $result = test_app( Grizzly => [qw(news)] );
like( $result->stdout, qr//, 'printed what we expected' );
is( $result->stderr, '', 'nothing sent to sderr' );
isnt( $result->error, undef, 'threw no exceptions' );

done_testing();
