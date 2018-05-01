TYPE := jrnl

PAPER := paper
BIBLIOGRAPHY := paper
EXTENSIONS := markdown+table_captions+yaml_metadata_block+superscript+subscript+auto_identifiers+implicit_header_references

OPTIONS := --pdf-engine pdflatex \
		-r $(EXTENSIONS) \
		--template="./templates/bare_$(TYPE).tex" \
		--filter pandoc-fignos \
		--filter pandoc-eqnos \
		--filter pandoc-tablenos \
		--meta link-citations=true \
		--number-sections \
		--meta autoref=false \
		--variable=biblio-files:$(BIBLIOGRAPHY)

all: pdf tex

pdf:
	pandoc \
		--filter pandoc-citeproc \
		--bibliography=$(BIBLIOGRAPHY).bib \
		--csl=./assets/ieee.csl \
		$(OPTIONS) $(PAPER).md -o $(PAPER).pdf

tex:
	pandoc \
		--biblatex \
		$(OPTIONS) $(PAPER).md -o $(PAPER).tex
