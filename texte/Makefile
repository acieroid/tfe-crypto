SRCDIR=src
PLOTDIR=plot
IMGDIR=images
OUTPUT=tfe.pdf

DIA=/usr/bin/dia

CONTENTDIR=contenu
APPENDIXDIR=annexes

MAINFILE=main.tex

all: pdf 

pdf: 
	pdflatex main.tex
	bibtex main
#	makeindex main.nlo -s gglo.ist -o main.nls
	pdflatex main.tex
	pdflatex main.tex
	mv main.pdf crypto.pdf

clean:
	rm -f *.aux *.log *.bbl *.toc *.glo *.gls *.ilg *.out *.nls *.nlo *.blg
distclean: clean
	rm -f *.pdf *.dvi
