.PHONY: all serve deploy

all: serve

serve:
	bundle exec jekyll serve --watch
