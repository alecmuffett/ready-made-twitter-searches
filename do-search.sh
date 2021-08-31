#!/bin/sh
make
egrep "Twitter Search LATEST:.*$*" < README.md |
    perl -pe 's/.*?\(//; s/\)[^\(\n]*$//' |
    while read url ; do
	open "$url"
    done
