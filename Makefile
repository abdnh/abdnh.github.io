.PHONY: all serve

all: curious/output/index.html

curious/output/index.html:
	tiddlywiki curious/ --output curious --build index

serve:
	jekyll serve

tw-serve:
	tiddlywiki curious/ --listen
