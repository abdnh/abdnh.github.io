.PHONY: all serve twserve deploy

all: curious/index.html

curious/index.html:
	tiddlywiki curious/ --output curious --build index

serve:
	bundle exec jekyll serve

twserve:
	tiddlywiki curious/ --listen

twpublish: curious/index.html
	git add curious/index.html
	git commit -m "TW publish"

deploy:
	git checkout master
	git push
	bundle exec jgd -c _config.yml
