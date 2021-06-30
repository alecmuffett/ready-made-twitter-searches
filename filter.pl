#!/usr/bin/perl -w
## eg: https://twitter.com/search?q=foo%20OR%20bar%20AND%20(baz%20OR%20wibble)&src=typed_query&f=live

use URI::Escape;

$format = 'https://twitter.com/search?q=%s&src=typed_query&f=live';

$key = 'UNDEFINED';
@keys = ();
%source = ();
%query = ();

print <<'EOT';
# ready-made-twitter-searches
prefabricated twitter searches for civil society purposes
EOT

while (<>) {
    next if /^##/;
    next if /^\s*$/;

    if (/^#\s(\w.*)/) {
	$key = $1;
	push(@keys, $key);
	next;
    }

    $source{$key} .= $_;

    s/\s+/ /g;
    s/(^\s|\s$)//g;
    s/"(\w+)"/$1/ge;
    $query{$key} .= "$_ ";
}

sub Escape {
    my $content = shift;
    $content =~ s!\(\s!(!g;
    $content =~ s!\s\)!)!g;
    uri_escape($content);
}

foreach $key (@keys) {
    print "## $key\n";
    my $url = sprintf($format, &Escape($query{$key}));
    print "[CLICK HERE TO QUERY: $key]($url)\n";
    print "### source:\n";
    print "```\n", $source{$key},  "```\n";
    print "\n";
}
