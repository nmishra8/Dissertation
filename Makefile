LATEX=latex
BIBTEX=bibtex
DVIPS=dvips
DVIPDF=dvipdf
DVIPDF=dvipdfm
PDFLATEX=pdflatex

#FIG-FILES = figures/*.png figures_tex/*.tex
TEX-FILES = *.tex tex/*.tex
BIB-FILES = *.bib
TOP-LEVEL-ROOT = thesis_template
CRNAME = THESIS-2017

all: ${TOP-LEVEL-ROOT}.pdf $(CRNAME)

${TOP-LEVEL-ROOT}.pdf: ${PDF-FILES} ${TEX-FILES} ${BIB-FILES} ${FIG-FILES}
	$(PDFLATEX) -shell-escape ${TOP-LEVEL-ROOT}
	$(PDFLATEX) -shell-escape ${TOP-LEVEL-ROOT}
	$(BIBTEX) ${TOP-LEVEL-ROOT}
	$(PDFLATEX) -shell-escape ${TOP-LEVEL-ROOT}
	$(PDFLATEX) -shell-escape ${TOP-LEVEL-ROOT}

$(CRNAME): $(TOP-LEVEL-ROOT).pdf
	gs -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -dEmbedAllFonts=true -sOutputFile=$(CRNAME).pdf -f $(TOP-LEVEL-ROOT).pdf

clean:
	rm -f *.auxlock *-blx.bib *.run.xml *.aux *.bbl *.blg *.log *.dvi *.out *.idx *.bak *~ *.toc *.lof *.pdf
	rm -f out/*

squeaky: clean
	rm -f *.pdf
