# docs-diagrams

**NOTE:**
Both imagemagick and pdf2svg are listed as requirements,
but in reality we will only use one after the initial
build system has been tested enough.

## Writer (Windows Setup)
### Setup

1. Install [MiKTeX](https://miktex.org/download)
2. Install [TikzEdt](http://tikzedt.org/) (There is a [portable version](https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/tikzedt/TikzEdtBeta0_2_3.zip) for regular users, i.e. no admin rights required).
3. In the TikzEdt settings, set the default from `pdflatex` to `xelatex` (needed for the custom font)

![image](\assets\settings.png)

### Optional
1. [GNU Make](http://gnuwin32.sourceforge.net/packages/make.htm)
2. [pdf2svg](http://www.cityinthesky.co.uk/opensource/pdf2svg/)

## Build system
### Requirements

* texlive (xelatex)
* Ruby
  * humanize (translate numbers to words, because Latex variables cannot contain digits)
