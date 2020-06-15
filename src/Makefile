ODIR=../out

LTX=xelatex
OPTS=-shell-escape -output-directory=$(ODIR)/

PDF2SVG=pdftocairo -svg
PDF2PNG=pdftocairo -png -singlefile

SRCS=$(wildcard *.tex)
_OUT=$(patsubst %, $(ODIR)/%, $(SRCS))
PDFS= $(_OUT:.tex=.pdf)
SVGS= $(_OUT:.tex=.svg)
# PNGs need special handling, because the extension .png is appended automatically
PNGS= $(_OUT:.tex=)

all: $(ODIR) $(PDFS) $(SVGS) $(PNGS)

pdf: $(ODIR) $(PDFS)

svg: $(ODIR) $(SVGS)

png: $(ODIR) $(PNGS)

$(ODIR):
	mkdir -p $(ODIR)

$(ODIR)/%.pdf: %.tex
	$(LTX) $(OPTS) $<

$(ODIR)/%.svg: $(ODIR)/%.pdf
	$(PDF2SVG) $< $@

# PNGs need special handling, because the extension .png is appended automatically
$(ODIR)/%: $(ODIR)/%.pdf
	$(PDF2PNG) $< $@

clean:
	rm -rf $(ODIR)

.PHONY: pdf svg png clean

