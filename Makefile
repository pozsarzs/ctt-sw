# +----------------------------------------------------------------------------+
# | CTT v0.1 * Transistor tester                                               |
# | Copyright (C) 2010-2012 Pozsar Zsolt <pozsarzs@gmail.com>                  |
# | Makefile                                                                   |
# | Make file for FreePascal source.                                           |
# +----------------------------------------------------------------------------+

include ./Makefile.global

dirs =  
srcfiles = ctt.lpr
binfiles = ctt

all:
	@for dir in $(dirs); do \
	  if [ -e Makefile ]; then make -C $$dir all; fi; \
	done
	@for x in $(srcfiles); do \
	  if [ -e $$x ]; then echo ""; $(compiler) $$x;  fi; \
	done
	@echo "Done."

clean:
	@for dir in $(dirs); do \
	  if [ -e Makefile ]; then make -C $$dir clean; fi; \
	done
	@rm --force *.o
	@rm --force *.ppu
	@for x in $(binfiles); do if [ -e $$x ]; then rm $$x; fi; done
	@echo "Done."
