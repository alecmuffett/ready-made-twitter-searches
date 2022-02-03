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

while (<>) {
    next if /^##/;
    s!\s+##.*!!; # remove inline comments
    next if /^\s*$/;

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

    s/\bAND\b\s*//g; # AND is apparently redundant

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
    my $tweet_text = "Check out the latest Twitter discussion with a #ReadyMadeTwitterSearch for:\n\n$tweet_key$tweet_subtitle\n\nat: $tweet_root#$tweet_anchor";
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
