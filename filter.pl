#!/usr/bin/perl -w
## eg: https://twitter.com/search?q=foo%20OR%20bar%20AND%20(baz%20OR%20wibble)&src=typed_query&f=live

use feature 'unicode_strings';
use utf8;
use URI::Escape;

my $search_top = 'https://twitter.com/search?q=%s&src=typed_query';
my $search_latest = 'https://twitter.com/search?q=%s&src=typed_query&f=live';
my $tweet_root = "https://github.com/alecmuffett/ready-made-twitter-searches";
my $tweet_intent = "https://twitter.com/intent/tweet?text";

$key = 'UNDEFINED';
@keys = ();
%source = ();
%query = ();
%links = ();
%anchors = ();

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

    s/"((\+\@|\w+:|#)?[-\w]+)"/$1/ge;
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

foreach $key (sort @keys) {
    $anchor = $key;
    $anchor =~ s/\@//go; # this needs work re: what can/cannot go into an anchor [1/2]
    $anchor =~ s/\s/-/g;
    $anchors{$key} = $anchor;
    print "* [$key](#$anchor)\n";
}
print "\n";

print "## searches\n";
print "\n";

foreach $key (@keys) {
    printf("### %s\n", uc($key));

    my $latest = sprintf($search_latest, &Escape($query{$key}));
    print "* :point_left: [Twitter Search LATEST: $key]($latest)\n";

    my $top = sprintf($search_top, &Escape($query{$key}));
    print "* :point_left: [Twitter Search TOP: $key]($top)\n";

    my $tweet_anchor = $anchors{$key};
    my $tweet_key = join(' ', map {ucfirst} split(' ', $key));
    my $tweet_text = "Debate continues! Check out the latest Twitter discussion on:\n\n$tweet_key\n\n\N{EM DASH} with a #ReadyMadeTwitterSearch at:\n\n$tweet_root#$tweet_anchor";
    my $tweet_url = sprintf("%s=%s", $tweet_intent, uri_escape_utf8($tweet_text));
    print "* :heart: [NEW: Tweet/Share this Search for '$key'!]($tweet_url)\n";
    print "* :arrow_up: [Back to Search Index](#search-index)\n";

    @urls = @{$links{$key}};
    if (@urls) {
	print "#### some interesting and relevant links\n";
	foreach $url (sort @urls) {
	    print "* $url\n";
	}
    }

    print "#### query source\n";
    print "```\n", $source{$key},  "```\n";

    print "\n";
}
