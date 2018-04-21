BINDIR = /usr/local/bin
BINFILE1 = git-machete
BINFILE2 = track-prs-bb

COMPDIR1 = /etc/bash_completion.d
COMPDIR2 = /usr/local/etc/bash_completion.d
COMPFILE = git-machete-prompt

.PHONY: all install uninstall

all:
	@echo "usage: make install"
	@echo "       make uninstall"

install:
	install -d $(BINDIR)
	install -m 0755 $(BINFILE1) $(BINDIR)
	install -m 0755 $(BINFILE2) $(BINDIR)
	install -d $(COMPDIR1)
	install -m 0644 $(COMPFILE) $(COMPDIR)
	install -d $(COMPDIR2)
	install -m 0644 $(COMPFILE) $(COMPDIR2)

uninstall:
	rm -f $(BINDIR)/$(BINFILE1)
	rm -f $(BINDIR)/$(BINFILE2)
	rm -f $(COMPDIR1)/$(COMPFILE)
	rm -f $(COMPDIR2)/$(COMPFILE)
