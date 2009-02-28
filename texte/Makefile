EPSDIR=eps
DIADIR=dia
SRCDIR=src
IMGDIR=images
OUTPUT=tfe.pdf

DIA=/usr/bin/dia

CONTENTDIR=contenu
APPENDIXDIR=annexes

MAINFILE=main.tex


PNG=$(notdir $(wildcard $(IMGDIR)/*.png))
PNG2EPS=$(patsubst %,$(EPSDIR)/%,$(PNG:.png=.eps))

JPG=$(notdir $(wildcard $(IMGDIR)/*.jpg))
JPG2EPS=$(patsubst %,$(EPSDIR)/%,$(JPG:.jpg=.eps))

DIA=$(notdir $(wildcard $(IMGDIR)/*.dia))
DIA2EPS=$(patsubst %,$(EPSDIR)/%,$(DIA:.jpg=.eps))

all: pdf 
#images pdf
images: $(PNG2EPS) $(JPG2EPS) $(DIA2EPS)

$(EPSDIR)/%.eps: $(IMGDIR)/%.png
	convert $< EPS:$@

$(EPSDIR)/%.eps: $(IMGDIR)/%.jpg
	convert $< EPS:$@

$(EPSDIR)/%.eps: $(FIGSDIR)/%.dia
	$(DIA) --export=$@ $<

pdf: 
	pdflatex main.tex
	bibtex main
#	makeindex main.nlo -s gglo.ist -o main.nls
	pdflatex main.tex
	pdflatex main.tex
#dvipdf main.dvi $(OUTPUT)
#	rm -f main.dvi
clean:
	rm -f *.aux *.log *.bbl *.toc *.glo *.gls *.ilg *.out *.nls *.nlo *.blg
distclean: clean
	rm -f *.pdf *.dvi
