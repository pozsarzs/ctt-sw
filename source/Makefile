# +----------------------------------------------------------------------------+
# | CTT v0.1 * transistor tester and characteristic curve plotter              |
# | Copyright (C) 2010-2022 Pozsar Zsolt <pozsarzs@gmail.com>                  |
# | Makefile                                                                   |
# | Make file for source code                                                  |
# +----------------------------------------------------------------------------+

include Makefile.global

srcfiles = ctt.lpr ctt-backend.pp
binfiles = ctt

all:
	@echo "- Compiling source code..."
	@mkdir -p ./lib/$(architecture)-$(os)/
	@for x in $(srcfiles); do \
	  if [ -e $$x ]; then fpc $(fpflag) $$x; echo ""; fi; \
	done
	@echo "done."

clean:
	@echo -n "- Cleaning source code..."
	@$(rm) ./lib/$(architecture)-$(os)/*
	@echo "done."

install:
	@echo -n "- Installing binary files..."
	@for x in $(binfiles); do \
	  if [ -e ./lib/$(architecture)-$(os)/$$x ]; then $(install) -m $(binmode) ./lib/$(architecture)-$(os)/$$x ../; fi; \
	done
	@echo "done."

uninstall:
	@echo -n "- Removing binary files..."
	@for x in $(binfiles); do $(rm) $(bindir)/$$x; done
	@echo "Done."

