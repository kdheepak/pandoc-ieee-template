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


OPTIONS := $(PDFENGINE) \
		-r $(EXTENSIONS) \
		$(FILTERS) \
		--meta link-citations=true \
		--number-sections \
		--meta autoref=false \
		--variable=biblio-files:$(BIBLIOGRAPHY)

PDFOPTIONS := $(OPTIONS) --template="./templates/bare.tex"

all: tex

html:
	pandoc \
		--filter pandoc-citeproc \
		--bibliography=$(BIBLIOGRAPHY).bib \
		--csl=./assets/ieee.csl \
		$(OPTIONS) $(PAPER).md -o $(PAPER).html

pdf:
	pandoc \
		$(PDFOPTIONS) \
		--filter pandoc-citeproc \
		--bibliography=$(BIBLIOGRAPHY).bib \
		--csl=./assets/ieee.csl \
		$(PAPER).md -o $(PAPER).pdf

tex:
	pandoc \
		--biblatex \
		$(PDFOPTIONS) \
		$(PAPER).md -o $(PAPER).tex
	pdflatex $(PAPER).tex > /dev/null 2>&1
	biber $(BIBLIOGRAPHY) > /dev/null 2>&1
	pdflatex $(PAPER).tex > /dev/null 2>&1
	pdflatex $(PAPER).tex > /dev/null 2>&1

