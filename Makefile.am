#
# This is part of eGovproc package.
#
#              Written by matsuand
#
SUBDIRS=data
docsdir = $(addprefix docs/, $(shell cat $(builddir)/data/xml/xmllist.txt | $(AWK) '{print $$1" "}' | uniq))

EXTRA_DIST = bin/submake.sh docs/css/*
DISTCLEANFILES = $(docsdir)

clean-local:
	-rm -f config.log configure~
	-rm -fr autom4te.cache
	-rm -rf $(docsdir)
