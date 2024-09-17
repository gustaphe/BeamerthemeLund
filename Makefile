.PHONY: all clean

latex = latexmk --xelatex --use-make --latexoption='--file-line-error --interaction=nonstopmode'
bibfile = $(wildcard *.bib)
figures = $(wildcard Figures/*)

all :

%.pdf : %.tex $(bibfile) $(figures)
	${latex} $<

buildings/%.png : buildings/%.tif
	magick $< -fuzz 1% -channel-fx '| gray=>alpha' -channel alpha -negate -trim +repage $@

%.bbl : %.bib
	biber $*

clean :
	${RM} *.log *.aux *.bll *.sync *.out *.fls *.xdv *.fdb_latexmk *.bbl *.bcf *.blg *.run.xml

