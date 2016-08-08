# pandoc-templates
Makefile and templates for converting Markdown files using Pandoc

## Setup 
If creating HTML files, create a directory for CSS files.  Within the `Makefile`, update the variable `CSS_DIR` with the preferred directory.  The default directory is `$(HOME)/.pandoc-css`.

## Usage
I often write notes in Markdown using [nvim](https://neovim.io) in the terminal.  When needing to share with others, I convert into docx, pdf, or standalone html.

Running any of the commands below will convert **all** Markdown files in the directory where the Makefile resides into the respective format.

```bash
## convert ==========
# convert all md files to docx
make docx

# convert all md files to pdf
make pdf

# convert all md files to standalone html (using a CSS file)
make html

# convert all md files to docx, pdf, and html
make all


## clean ==========
# remove all docx files
make clean_docx

# remove all pdf files
make clean_pdf

# remove all html files
make clean_html

# remove all docx, pdf, and html files
make clean


## rebuild ==========
# clean and convert all docx files
make rebuild_docx

# clean and convert all pdf files
make rebuild_pdf

# clean and convert all html files
make rebuild_html

# clean and convert all docx, pdf, and html files
make rebuild

```
## CSS
## Inspiration
* CSS
    * [Ryan Gray - buttondown.css](https://gist.github.com/ryangray/1882525)
    * [Brett Terpstra - Marked CSS files](https://github.com/ttscoff/MarkedCustomStyles) - good source of CSS files (note all are copyright [Brett Terpstra](https://github.com/ttscoff))
* Makefile
    * [Lincoln Mullen - Makefile](https://gist.github.com/lmullen/3767386)
    * [Kieran Healy - Makefile](https://github.com/kjhealy/pandoc-templates/blob/master/makefile/Makefile)
* pandoc-templates
    * [Kieran Healy - pandoc-templates repo](https://github.com/kjhealy/pandoc-templates)
