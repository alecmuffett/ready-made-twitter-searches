#!/bin/sh
make
egrep "Twitter Search LATEST:.*$*" < README.md |
    perl -pe 's/.*?\(//;s/\)$//' |
    while read url ; do
	open "$url"
    done
