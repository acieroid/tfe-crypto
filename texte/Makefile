EPSDIR=eps
DIADIR=dia
SRCDIR=src
IMGDIR=images
OUTPUT=tfe.pdf

CONTENTDIR=contenu
APPENDIXDIR=annexes

MAINFILE=main.tex



all: pdf

pdf: dia
	latex main.tex
	bibtex main
	latex main.tex
	latex main.tex
	dvipdf main.dvi $(OUTPUT)
	rm -f main.dvi
clean:
	rm -f *.aux *.log *.bbl *.toc
distclean: clean
	rm -f *.pdf *.dvi
