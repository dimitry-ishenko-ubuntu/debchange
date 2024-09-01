PREFIX  = /usr
BINDIR  = $(PREFIX)/bin
DATADIR = $(PREFIX)/share
MANDIR  = $(DATADIR)/man

COMPLETIONS_DIR = $(shell pkg-config --variable=completionsdir bash-completion)
PERL_MODULE_DIR = $(shell perl -MConfig -e 'print $$Config{vendorlib}')

all:

install:
	install -t $(DESTDIR)$(PERL_MODULE_DIR)/Devscripts -D Compression.pm Debbugs.pm
	install -t $(DESTDIR)$(BINDIR) -D debchange
	ln -s debchange $(DESTDIR)$(BINDIR)/dch
	install -t $(DESTDIR)$(MANDIR)/man1 -D debchange.1
	ln -s debchange.1 $(DESTDIR)$(MANDIR)/man1/dch.1
	install -D debchange.bash_completion $(DESTDIR)$(COMPLETIONS_DIR)/debchange
	ln -s debchange $(DESTDIR)$(COMPLETIONS_DIR)/dch
