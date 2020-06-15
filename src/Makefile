ODIR=../out

LTX=xelatex
OPTS=-shell-escape -output-directory=$(ODIR)/

PDF2SVG=pdf2svg
SVG2PNG=svg2png

SRCS=$(wildcard *.tex)
_OUT=$(patsubst %, $(ODIR)/%, $(SRCS))
PDFS= $(_OUT:.tex=.pdf)
SVGS= $(_OUT:.tex=.svg)
PNGS= $(_OUT:.tex=.png)

all: $(ODIR) $(PDFS) $(SVGS) $(PNGS)

$(ODIR):
	mkdir -p $(ODIR)

$(ODIR)/%.pdf: %.tex
	$(LTX) $(OPTS) $<

$(ODIR)/%.svg: $(ODIR)/%.pdf
	$(PDF2SVG) $< $@

$(ODIR)/%.png: $(ODIR)/%.svg
	$(SVG2PNG) $< $@

clean:
	rm -rf $(ODIR)

.PHONY: clean

