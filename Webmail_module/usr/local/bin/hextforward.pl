#!/usr/bin/perl

use strict qw( vars );
use User::pwent;
use URI::URL;
use LWP::UserAgent;

#
# hextforward.pl by Yunho Kim, May. 2008.  version 1.0
# Contact info: http://www.handysoft.co.kr
#
# Put your hextforward URL here
#
#### External Forward URL
#my $hextforward_url_info = 'http://10.98.10.114:8206/wma/frwd.do';
my $hextforward_url_info = 'http://10.51.115.1/wma/frwd.do';

my $timeout_seconds = 30;

my $msgid = $ARGV[0];
my $user = $ARGV[1];

my $hextforward_url = new URI::URL("$hextforward_url_info");
my $hextforward_ua = new LWP::UserAgent;

$hextforward_ua->timeout($timeout_seconds);

my $resp = $hextforward_ua->post($hextforward_url, {'acton' =>'externalforward' ,'msgid' => "$msgid", 'username' => "$user"});

if ($resp->is_success) {
    print "succeeded\n";
} else {
    print "failed\n";
} 
