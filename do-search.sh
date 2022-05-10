#!/bin/sh
make

egrep "LATEST.Tweets" < README.md |
    egrep -i "$@" |
    perl -pe 's/.*?\(//; s/\)[^\(\n]*$//' |
    while read url ; do
	open "$url"
    done
