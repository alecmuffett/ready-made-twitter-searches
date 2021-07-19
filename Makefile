all:
	./filter.pl raw-searches.md > README.md

open:
	open https://github.com/alecmuffett/ready-made-twitter-searches

clean:
	rm *~
