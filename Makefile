.PHONY: all serve twserve deploy

all: curious/output/index.html

curious/output/index.html:
	tiddlywiki curious/ --output curious --build index

serve:
	bundle exec jekyll serve

twserve:
	tiddlywiki curious/ --listen

twpublish: curious/output/index.html
	git add curious/index.html
	git commit -m "TW publish"

deploy:
	git checkout master
	git push
	bundle exec jgd -c _config.yml
