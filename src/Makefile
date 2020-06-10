ODIR=../out

LTX=xelatex
OPTS=-shell-escape -output-directory=$(ODIR)/

PDF2SVG=pdf2svg

SRCS=$(wildcard *.tex)
_OUT=$(patsubst %, $(ODIR)/%, $(SRCS))
PDFS= $(_OUT:.tex=.pdf)
SVGS= $(_OUT:.tex=.svg)

all: $(ODIR) $(PDFS) $(SVGS)

$(ODIR):
	mkdir -p $(ODIR)

$(ODIR)/%.pdf: %.tex
	$(LTX) $(OPTS) $<

$(ODIR)/%.svg: $(ODIR)/%.pdf
	$(PDF2SVG) $< $@

clean:
	rm -rf $(ODIR)

.PHONY: clean

