all:
	./filter.pl raw-searches.md > README.md
	./filter.pl -A raw-searches.md > ARCHIVE.md

open:
	open https://github.com/alecmuffett/ready-made-twitter-searches

push: all
	git add . && git commit -m "make on `datestamp`" && git push
	make open

clean:
	rm *~
