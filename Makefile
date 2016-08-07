# Produce pdf & docx files from all markdown in a directory
# Adapted from
# 	https://gist.github.com/lmullen/3767386

# List files to run through make by finding all *.md files and 
# substituting for either docx or pdf
DOCXS := $(patsubst %.md,%.docx,$(wildcard *.md))
PDFS := $(patsubst %.md,%.pdf,$(wildcard *.md))
HTMLS := $(patsubst %.md,%.html,$(wildcard *.md))

# *.md ==convert==> *.docx
docx : $(DOCXS)

# *.md ==convert==> *.pdf
pdf : $(PDFS)

# *.md ==convert==> *.html
html : $(HTMLS)

# Actual execution
# Remember it is target : source
%.pdf : %.md
	pandoc $< -o $@ -V geometry:"top=0.75in, bottom=0.75in, left=0.75in, right=0.75in"

%.docx : %.md
	pandoc -s -S $< -o $@

%.html : %.md
	pandoc -s -S -c /Users/calex/.pandoc/buttondown.css $< -o $@
	
# Remove all pdfs
clean_pdf :
	rm $(PDFS)

# Remove all docxs
clean_docx : 
	rm $(DOCXS)

# Remove all docxs
clean_html : 
	rm $(HTMLS)

# Rebuild all pdfs
rebuild_pdf : clean_pdf pdf

# Rebuild all docx
rebuild_docx : clean_docx docx

# Rebuild all html
rebuild_html : clean_html docx

# All - rebuild pdf, docx, and html
all: rebuild_pdf rebuild_docx rebuild_html
