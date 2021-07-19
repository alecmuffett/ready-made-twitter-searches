#!/usr/bin/perl -w
## eg: https://twitter.com/search?q=foo%20OR%20bar%20AND%20(baz%20OR%20wibble)&src=typed_query&f=live

use URI::Escape;

$search_top = 'https://twitter.com/search?q=%s&src=typed_query';
$search_latest = 'https://twitter.com/search?q=%s&src=typed_query&f=live';

$key = 'UNDEFINED';
@keys = ();
%source = ();
%query = ();
%links = ();

while (<>) {
    next if /^##/;
    next if /^\s*$/;

    s!\s##.*!!; # remove inline comments

    if (/^#\s(\w.*)/) {
	$key = $1;
	$key =~ s!\s+! !;
	$key =~ s!\s$!!;
	@{$links{$key}} = ();
	push(@keys, $key);
	next;
    }

    if (/^\*\s(\S.*)/) {
	$url = $1;
	$url =~ s!\s+! !;
	$url =~ s!\s$!!;
	push(@{$links{$key}}, $url);
	next;
    }

    s/"((\+\@|#)?\w+)"/$1/ge;
    $source{$key} .= $_;

    s/\s+/ /g;
    s/(^\s|\s$)//g;
    $query{$key} .= "$_ ";
}

sub Escape {
    my $content = shift;
    $content =~ s!\(\s!(!g;
    $content =~ s!\s\)!)!g;
    uri_escape($content);
}

print <<'EOT';
# `#ReadyMadeTwitterSearches`
prefabricated twitter searches for civil society purposes.

be aware: no responsibility can or will be accepted for the contents
of tweets that are returned by these searches.

for additions, please submit pull requests against `raw-searches.md`, **only**.

## search index
EOT

foreach $key (sort(@keys)) {
    $anchor = $key;
    $anchor =~ s/\s/-/g;
    print "* [$key](#$anchor)\n";
}
print "\n";

print "## searches\n";
print "\n";

foreach $key (@keys) {
    print "### $key\n";

    my $latest = sprintf($search_latest, &Escape($query{$key}));
    print "* [Twitter Search LATEST: $key]($latest)\n";

    my $top = sprintf($search_top, &Escape($query{$key}));
    print "* [Twitter Search TOP: $key]($top)\n";

    @urls = @{$links{$key}};
    if (@urls) {
	print "#### some relevant links\n";
	foreach $url (@urls) {
	    print "* $url\n";
	}
    }

    print "#### query source\n";
    print "```\n", $source{$key},  "```\n";

    print "\n";
}
