require "rack"
require "rack/contrib/try_static"

`middleman build`

use Rack::TryStatic,
    :root => "tmp",
    :urls => %w[/],
    :try => ['.html', 'index.html', '/index.html']

run lambda { [404, {'Content-Type' => 'text/html'}, ['whoops! Not Found']] }