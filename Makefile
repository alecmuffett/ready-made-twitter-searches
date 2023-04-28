FILTER=./filter.pl
SRC=raw-searches.md
DST=README.md

$(DST): $(SRC) $(FILTER)
	(FILTER) $(SRC) > $(DST)
	mmark -html -index < $(DST) > README.html
	(FILTER) -A $(SRC) > ARCHIVE.md

push: $(DST)
	git add . && git commit -m "make on `datestamp`" && git push
	make open

open:
	open https://github.com/alecmuffett/ready-made-twitter-searches

clean:
	rm *~
