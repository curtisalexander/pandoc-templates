# Produce docx, pdf, and html files from all markdown in a directory
# Adapted from
# 	https://gist.github.com/lmullen/3767386

# List files to run through make by finding all *.md files and 
#   substituting for either docx or pdf
DOCXS := $(patsubst %.md,%.docx,$(wildcard *.md))
PDFS := $(patsubst %.md,%.pdf,$(wildcard *.md))
HTMLS := $(patsubst %.md,%.html,$(wildcard *.md))

# *.md ==convert==> *.docx
docx : $(DOCXS)

# *.md ==convert==> *.pdf
pdf : $(PDFS)

# *.md ==convert==> *.html
html : $(HTMLS)

# directory where css is located
CSS_DIR := $(HOME)/.pandoc-css/kult.css

# Actual execution
# Remember it is target : source
%.docx : %.md
	pandoc -s -S $< -o $@

%.pdf : %.md
	pandoc $< -o $@ -V geometry:"top=0.75in, bottom=0.75in, left=0.75in, right=0.75in"

%.html : %.md
	pandoc -s -S -c $(CSS_DIR) $< -o $@

all : docx pdf html

# Remove all docx files
clean_docx : 
	rm $(DOCXS)

# Remove all pdf files
clean_pdf :
	rm $(PDFS)

# Remove all html files
clean_html : 
	rm $(HTMLS)

# Remove all docx, pdf, and html files
clean: clean_docx clean_pdf clean_html

# Rebuild all docx files
rebuild_docx : clean_docx docx

# Rebuild all pdf files
rebuild_pdf : clean_pdf pdf

# Rebuild all html files
rebuild_html : clean_html html

# Rebuild all docx, pdf, and html files
rebuild: rebuild_docx rebuild_pdf rebuild_html
