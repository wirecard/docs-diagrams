SRCDIR=src/

all:
	cd $(SRCDIR) && $(MAKE)

clean:
	cd $(SRCDIR) && $(MAKE) clean

.PHONY: clean

