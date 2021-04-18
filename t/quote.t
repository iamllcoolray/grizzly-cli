use Test::More tests => 5;
use App::Cmd::Tester;

use Grizzly;

my $result = test_app(Grizzly => [ qw(quote ibm) ]);
isnt($result->output, '', 'gives an output for quote info');

my $result = test_app(Grizzly => [ qw(quote coin) ]);
isnt($result->output, '', 'gives an output for quote info');

my $result = test_app(Grizzly => [ qw(quote dis) ]);
isnt($result->output, '', 'gives an output for quote info');

my $result = test_app(Grizzly => [ qw(quote msft) ]);
isnt($result->output, '', 'gives an output for quote info');

my $result = test_app(Grizzly => [ qw(quote 1) ]);
isnt($result->output, '', 'gives an output for quote info');
