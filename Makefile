.PHONY: all serve tw-serve deploy

all: curious/output/index.html

curious/output/index.html:
	tiddlywiki curious/ --output curious --build index

serve:
	bundle exec jekyll serve

tw-serve:
	tiddlywiki curious/ --listen

deploy:
	bundle exec jgd -c _config.yml
