.SUFFIXES: .pdf .tex .svg .png .jpg

SVGS = $(wildcard *.svg)

IMAGES = $(wildcard *.png) $(wildcard *.jpg) $(SVGS:.svg=.pdf)

all: connascence.pdf

connascence.pdf: connascence.tex $(IMAGES)
	pdflatex -shell-escape $<

clean:
	rm -Rf *.pdf _minted-connascence *.aux *.log *.out

.svg.pdf:
	rsvg-convert -f pdf -o $@ $<
