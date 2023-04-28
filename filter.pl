#!/usr/bin/perl -w
## eg: https://twitter.com/search?q=foo%20OR%20bar%20AND%20(baz%20OR%20wibble)&src=typed_query&f=live

use feature 'unicode_strings';
use utf8;
use URI::Escape;

if ($ARGV[0] eq '-A') {
    $archive_flag = 1;
    shift;
} else {
    $archive_flag = 0;
}

my $title_extract_len = 100;

my $max_query_length = 512; # https://developer.twitter.com/en/docs/twitter-api/tweets/search/integrate/build-a-query
my $search_top = 'https://twitter.com/search?q=%s&src=typed_query';
my $search_latest = 'https://twitter.com/search?q=%s&src=typed_query&f=live';
my $tweet_root = "https://github.com/alecmuffett/ready-made-twitter-searches";
my $tweet_intent = "https://twitter.com/intent/tweet?text";
my $issue_link = "$tweet_root/issues/new";

my $key = 'UNDEFINED';
my @keys = ();
my %source = ();
my %query = ();
my %links = ();
my %anchors = ();
my %subtitles = ();

sub ExpandPhrase {
    my $src = lc("@_");
    my @words = map {ucfirst} split(' ', $src);
    my $dst = "@words";
    $dst =~ s!\s+!!go;
    return sprintf('"%s" OR "%s"', $src, $dst);
}

while (<>) {
    next if /^##/;
    s!\s+##.*!!; # remove inline comments
    next if /^\s*$/;

    # preprocessor
    s!\<(.*?)\>!&ExpandPhrase($1)!goe;

    if (/^#\s+([\w"'].*)/) { # eats leading w/s
	$key = $1;
	my $subtitle = '';
	$key =~ s!\s+! !; # merge w/s
	$key =~ s!\s$!!; # strip trailing w/s
	if ($key =~ /(.*?)\s*\|\s*(.*)/) {
	    $key = $1;
	    $subtitle = $2;
	}
	$key =~ s/\s+$//;;
	$subtitles{$key} = $subtitle;
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

    if (/^\-\s(\S.*)/) {
	$url = $1;
	$url =~ s!\s+! !;
	$url =~ s!\s$!!;

	my $url_host = '-';
	if ($url =~ m!^https?://(([-\w]+\.)*[-\w]+)/!oi) {
	    $url_host = $1;
	    $url_host =~ s!^www\.!!go;
	}

	my $url_title = `web-page-title $url | unicode-to-ascii`;
	$url_title =~ s!^https?://(([-\w]+\.)*[-\w]+)/!!o; # remove http://host.dom/ for no-title pages
	$url_title =~ s!\&\#\w+;!!go;
	$url_title =~ s![^\w\s-]+! !go;
	$url_title =~ s!\s+! !;
	$url_title =~ s!\s$!!;
	$url_title =~ s!^\s!!;
	$url_title = substr($url_title, 0, $title_extract_len);

	my $text = "[$url_title]($url) **($url_host)**";
	push(@{$links{$key}}, $text);
	next;
    }

    s/\bAND\b\s*//g; # AND is apparently redundant

    s/"((\+\@|\w+:|#)?[-\w]+)"/$1/ge; # "foo" -> foo

    s/(#\w+)/($1)/go; # #foo -> (#foo)

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

for additions, please submit pull requests against `raw-searches.md`,
**only**.

"current" searches are in [README.md](README.md);
older searches are archived in [ARCHIVE.md](ARCHIVE.md).

## search index
EOT

if ($archive_flag) {
    @keys = grep(/\sARCHIVE$/, @keys);
} else {
    @keys = grep(!/\sARCHIVE$/, @keys);
}

foreach $key (@keys) {
    $anchor = $key;
    $anchor =~ s/\@//go; # this needs work re: what can/cannot go into an anchor [1/2]
    $anchor =~ s/\s/-/g;
    $anchor =~ tr/A-Z/a-z/;
    $anchor =~ tr/-0-9a-z//cd;
    $anchors{$key} = $anchor;
}

# reordering
@keys = sort { $anchors{$a} cmp $anchors{$b} } @keys;

foreach $key (@keys) {
    my $subtitle = $subtitles{$key};
    $subtitle = " ($subtitle)" if ($subtitle ne '');
    print "* [$key](#$anchors{$key})$subtitle\n";
}
print "\n";

print "## searches\n";
print "\n";

foreach $key (@keys) {
    printf("### %s\n", uc($key));

    my $subtitle = $subtitles{$key};
    printf("#### %s\n", uc($subtitle)) if ($subtitle ne '');

    my $query_text = $query{$key};
    $query_text =~ s/^\s//;
    $query_text =~ s/\s$//;
    $query_text =~ s/\s+/ /go;
    $query_text =~ s/\)\s\(/)(/go;

    my $query_length = length $query_text;
    die "overlong: $query_length query for $key\n" if ($query_length > $max_query_length);

    my $latest = sprintf($search_latest, &Escape($query_text));
    print "* :point_right: [$key - LATEST Tweets]($latest)\n";

    my $top = sprintf($search_top, &Escape($query_text));
    print "* :point_right: [$key - TOP Tweets]($top)\n";

    my $tweet_anchor = $anchors{$key};
    my $tweet_key = join(' ', map {ucfirst} split(' ', $key));
    my $tweet_subtitle = ($subtitle eq '' ? '' : " \N{EM DASH} " . $subtitle);
    my $tweet_text = "Here's a #ReadyMadeTwitterSearch for tweets about:\n\n$tweet_key$tweet_subtitle\n\n\N{HORIZONTAL ELLIPSIS}with links & more information at: $tweet_root#$tweet_anchor";
    my $tweet_url = sprintf("%s=%s", $tweet_intent, uri_escape_utf8($tweet_text));
    print "* :heart: [Share this Search for '$key' in a Tweet!]($tweet_url)\n";

    print "* :arrow_up: [Back to Search Index](#search-index)\n";

    print "* :bulb: [Suggest an Improvement]($issue_link)\n";

    @urls = @{$links{$key}};
    if (@urls) {
	print "#### some interesting and relevant links\n";
	foreach $url (sort @urls) {
	    print "* $url\n";
	}
    }

    print "#### query source ($query_length/$max_query_length characters)\n";
    print "```\n", $source{$key},  "```\n";

    print "\n";
}
