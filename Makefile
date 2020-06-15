SRCDIR=src/

all:
	cd $(SRCDIR) && $(MAKE)

pdf svg png clean:
	cd $(SRCDIR) && $(MAKE) $@

.PHONY: pdf svg png clean

