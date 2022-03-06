.PHONY: all serve twserve deploy

TWDIR := curious

all: $(TWDIR)/index.html

$(TWDIR)/index.html: $(TWDIR)/tiddlers $(TWDIR)/plugins $(TWDIR)/tiddlywiki.info
	tiddlywiki $(TWDIR)/ --output $(TWDIR) --build index

serve:
	bundle exec jekyll serve --incremental --watch

twserve:
	tiddlywiki $(TWDIR)/ --listen

twpublish: $(TWDIR)/index.html
	git add $(TWDIR)/index.html
	git commit -m "TW publish"

deploy:
	git checkout master
	git push
	bundle exec jgd -c _config.yml
