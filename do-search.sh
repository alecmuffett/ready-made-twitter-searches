#!/bin/sh
make
egrep "LATEST Tweets.*$*" < README.md |
    perl -pe 's/.*?\(//; s/\)[^\(\n]*$//' |
    while read url ; do
	open "$url"
    done
