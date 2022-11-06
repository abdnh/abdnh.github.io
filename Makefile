.PHONY: all serve deploy

all: serve

serve:
	bundle exec jekyll serve --watch

deploy:
	git checkout master
	git push
	./deploy.sh
