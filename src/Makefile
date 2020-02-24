ODIR=../out/

LTX=xelatex
OPTS=-shell-escape -output-directory=$(ODIR)/

SRCS=$(wildcard *.tex)
_SVGS=$(patsubst %, $(ODIR)/%, $(SRCS))
SVGS= $(_SVGS:.tex=.svg)

all: $(ODIR) $(SVGS)

$(ODIR):
	mkdir -p $(ODIR)

$(ODIR)/%.svg: %.tex
	$(LTX) $(OPTS) $<

clean:
	rm -rf $(ODIR)

.PHONY: clean

