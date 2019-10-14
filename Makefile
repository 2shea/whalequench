build:
	bundle exec jekyll build
serve:
	jekyll serve
test: build
	bundle exec htmlproofer ./_site/
