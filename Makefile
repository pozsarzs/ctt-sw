# +----------------------------------------------------------------------------+
# | CTT v0.1 * Transistor tester                                               |
# | Copyright (C) 2010-2011 Pozsar Zsolt <info@pozsarzs.hu>                    |
# | Makefile                                                                   |
# | Make file for FreePascal source.                                           |
# +----------------------------------------------------------------------------+

all:
	@ppc386 ctt.lpr
	@echo "Done."

clean:
	@rm --force *.o *.ppu ctt
	@echo "Done."
