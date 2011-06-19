# +----------------------------------------------------------------------------+
# | CTT v0.1 * Transistor tester                                               |
# | Copyright (C) 2010 Pozsar Zsolt <info@pozsarzs.hu>                         |
# | Makefile                                                                   |
# | Make file for FreePascal source.                                           |
# +----------------------------------------------------------------------------+

all:
	@ppc386 backend.lpr
	ren backend.exe ctt-backend.exe
	@echo "Done."

clean:
	@rm --force *.o ctt-backend.exe
	@echo "Done."
