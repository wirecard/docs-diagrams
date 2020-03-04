# docs-diagrams

**NOTE:**
Both imagemagick and pdf2svg are listed as requirements,
but in reality we will only use one after the initial
build system has been tested enough.

## Writer (Windows Setup)
### Setup

1. Install [MiKTeX](https://miktex.org/download)
2. Install [TikzEdt](http://tikzedt.org/)
3. In the TikzEdt options, set the default from `pdflatex` to `xelatex` (needed for the custom font)

### Optional
1. [GNU Make](http://gnuwin32.sourceforge.net/packages/make.htm)
2. [pdf2svg](http://www.cityinthesky.co.uk/opensource/pdf2svg/)

## Build system
### Requirements

* texlive (xelatex)
* pdf2svg
* Ruby
  * humanize (translate numbers to words, because Latex variables cannot contain digits)
