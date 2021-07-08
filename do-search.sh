#!/bin/sh
make
egrep "TWITTER QUERY:.*$*" < README.md |
    perl -pe 's/.*?\(//;s/\)$//' |
    while read url ; do
	open "$url"
    done
