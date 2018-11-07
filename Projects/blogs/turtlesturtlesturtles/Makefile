default:
	ghc ./site.hs -o site

all:
	rm ./site
	rm ./site.o
	rm ./site.hi
	ghc ./site.hs -o site
	./site clean
	./site build

preview:
	./site clean
	./site build
	./site watch

publish:
	cp -R ./_site/* ../madjestic.github.io/
