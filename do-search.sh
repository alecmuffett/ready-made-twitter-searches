#!/bin/sh
make

cat README.md ARCHIVE.md |
    egrep "LATEST.Tweets" |
    egrep -i "$@" |
    perl -pe 's/.*?\(//; s/\)[^\(\n]*$//' |
    while read url ; do
	open "$url"
    done
