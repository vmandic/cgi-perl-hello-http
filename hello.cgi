#!/usr/bin/env perl

use v5.36;
use CGI::Tiny;

cgi {
  # Get the CGI object
  my $cgi = $_;

  # Get the value of the 'name' parameter
  my $name = $cgi->param('name');

  # Customize greeting message if 'name' parameter is specified
  my $greeting = CGI::Tiny::escape_html( 'Hello, ' . ( $name || 'CGI' ) . '!' );

  # Print HTML response
  $cgi->render( html => <<~"HTML");
    <html>
      <head><title>Hello CGI</title></head>
      <body>
        <h1>$greeting</h1>
      </body>
    </html>
    HTML
}
