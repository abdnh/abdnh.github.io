.PHONY: all serve

all: notes/output/index.html

notes/output/index.html:
	tiddlywiki notes/ --output notes --build index

serve:
	jekyll serve

tiddlywiki-serve:
	tiddlywiki notes/ --listen
