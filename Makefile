# Foo
CC := pdflatex
RESULTFILE = presentation.pdf
NAMESRC = presentation
BUILDFILENAME = build

default:
	make presentation

presentation:
	make clean
	make compilepresentation
	make fullbuild
	make clean

compilepresentation:
	echo "\\input{"$(NAMESRC)"}" >> $(BUILDFILENAME).tex

build:
	$(CC) "\input{"$(BUILDFILENAME)"}"

fullbuild:
	make build
	#bibtex *.aux
	make build
	make build
	mv $(BUILDFILENAME).pdf $(RESULTFILE)

.PHONY: clean
clean:
	rm -fv vc.tex \
		*.aux \
		*.bbl \
		*.blg \
		*.brf \
		*.idx \
		*.ilg \
		*.ind \
		*.lof \
		*.lol \
		*.lot \
		*.log \
		*.out \
		*.toc \
		*.spl \
		$(BUILDFILENAME).tex
