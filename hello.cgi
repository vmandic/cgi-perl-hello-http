#!/usr/bin/perl

use strict;
use warnings;
use CGI;

# Create a new CGI object
my $cgi = CGI->new();

# Get the value of the 'name' parameter
my $name = $cgi->param('name');

# Default greeting message if 'name' parameter is not specified
my $greeting = "Hello, CGI!";

# Customize greeting message if 'name' parameter is specified
if ($name) {
    $greeting = "Hello, $name!";
}

# Print HTTP header with content type
print $cgi->header('text/html');

# Print HTML response
print "<html><head><title>Hello CGI</title></head><body>";
print "<h1>$greeting</h1>";
print "</body></html>";

