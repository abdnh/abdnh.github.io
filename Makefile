.PHONY: all serve deploy

all: serve

serve:
	bundle exec jekyll serve --incremental --watch

deploy:
	git checkout master
	git push
	bundle exec jgd -c _config.yml
