#
# This is part of eGovproc package.
#
#              Written by matsuand
#
srcdir  = @srcdir@
XMLDATADIR = $(top_srcdir)/@top_XMLDATADIR@
HTMLOUTDIR = $(top_builddir)/@top_HTMLOUTDIR@

baselist = $(shell cat $(srcdir)/xmllist.txt | $(AWK) '{print $$1"/"$$3"/"$$5" "}')
EXTRA_DIST = template.xml xmllist.txt \
	$(addsuffix .xml, $(baselist))
DISTCLEANFILES = Makefile.sub

SRCS  = $(addprefix $(XMLDATADIR)/, $(addsuffix .xml,  $(baselist)))
DESTS = $(addprefix $(HTMLOUTDIR)/, $(addsuffix .html, $(baselist)))

SUFFIXES = .xml .html
.xml.html:
	$(MKDIR_P) $(dir $@)
	$(XSLTPROC) --output $@ $(XMLDATADIR)/egovproc.xsl $<

all: $(DESTS)

-include Makefile.sub
Makefile.sub: $(top_srcdir)/bin/submake.sh $(srcdir)/Makefile.am $(top_builddir)/config.log
	@$(SHELL) $(top_srcdir)/bin/submake.sh $(baselist)
