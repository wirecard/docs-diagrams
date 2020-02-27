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
4. Install [ImageMagick](https://imagemagick.org/script/download.php) (needed for the direct conversion from tikz to svg)
5. Install [pdf2svg](http://www.cityinthesky.co.uk/opensource/pdf2svg/)

### Optional
1. [GNU Make](http://gnuwin32.sourceforge.net/packages/make.htm)

## Build system
### Requirements

* texlive (xelatex)
* imagemagick
* pdf2svg
* Ruby
  * humanize
