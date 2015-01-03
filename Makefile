SHELL = /bin/sh

builds = $(PWD)/builds
dkr = docker run --rm
gitbook = $(dkr) -v $(PWD):/repository humboldtux/gitbook
.SUFFIXES:

.PHONY: clean dirs pdf epub mobi site ebook page json ebooks test gitbook dev

default: all

dirs:
	mkdir -p $(builds)/ebooks

site: dirs
	$(gitbook) build --output=./builds/site
	xdg-open $(builds)/site/index.html

page: dirs
	$(gitbook) build -f page --output=./builds/page
	xdg-open $(builds)/page

ebook: dirs
	$(gitbook) build -f ebook --output=./builds/ebook
	xdg-open $(builds)/ebook

json: dirs
	$(gitbook) build -f json --output=./builds/json
	xdg-open $(builds)/json

pdf: dirs
	rm -f builds/ebooks/*pdf
	$(gitbook) pdf
	mv *pdf builds/ebooks
	xdg-open $(builds)/ebooks/*pdf

epub: dirs
	rm -f builds/ebooks/*epub
	$(gitbook) epub
	mv *epub builds/ebooks
	xdg-open $(builds)/ebooks/*epub

mobi: dirs
	rm -f builds/ebooks/*mobi
	$(gitbook) mobi
	mv *mobi builds/ebooks
	xdg-open $(builds)/ebooks/*mobi

ebooks: pdf epub mobi

clean:
	sudo rm -rf $(builds)

gitbook:
	fig up -d gitbook
	xdg-open http://localhost:4000
	xdg-open http://localhost:35729

dev: gitbook
	xdg-open "http://translate.google.fr/translate?hl=fr&sl=zh-CN&u=http://yeasy.gitbooks.io/docker_practice/content/"

all: clean site page ebook json ebooks
