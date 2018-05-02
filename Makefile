PANDOCVERSION := $(shell pandoc --version | head -n 1 | cut -d ' ' -f 2 | cut -f1 -d.)
PAPER := paper
BIBLIOGRAPHY := paper

EXTENSIONS := markdown+table_captions+yaml_metadata_block+superscript+subscript+auto_identifiers+implicit_header_references
FILTERS := --filter pandoc-fignos \
		--filter pandoc-eqnos \
		--filter pandoc-tablenos

ifeq ($(PANDOCVERSION), 1)
	PDFENGINE := --latex-engine pdflatex
else
	PDFENGINE := --pdf-engine pdflatex
endif


OPTIONS := -s -f markdown+smart $(PDFENGINE) \
		-r $(EXTENSIONS) \
		$(FILTERS) \
		--meta link-citations=true \
		--number-sections \
		--meta autoref=false \
		--variable=biblio-files:$(BIBLIOGRAPHY)

PDFOPTIONS := $(OPTIONS) --template="./templates/bare.tex"
HTMLOPTIONS := $(OPTIONS) -w html --template="./templates/html.template" --css="./assets/kultiad-serif.css"

PANDOCCITEPROCOPTIONS := --filter pandoc-citeproc \
		--bibliography=$(BIBLIOGRAPHY).bib \
		--csl=./assets/ieee.csl

all: tex

html:
	pandoc \
		$(HTMLOPTIONS) $(PANDOCCITEPROCOPTIONS) \
		$(PAPER).md -o $(PAPER).html

pdf:
	pandoc \
		$(PDFOPTIONS) $(PANDOCCITEPROCOPTIONS) \
		$(PAPER).md -o $(PAPER).pdf

tex:
	pandoc \
		--biblatex \
		$(PDFOPTIONS) \
		$(PAPER).md -o $(PAPER).tex
	latexmk --quiet -pdf $(PAPER).tex > /dev/null 2>&1


