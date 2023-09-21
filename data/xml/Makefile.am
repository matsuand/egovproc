#
# This is part of eGovproc package.
#
#              Written by matsuand
#
srcdir  = @srcdir@
XMLDATADIR = $(top_srcdir)/@top_XMLDATADIR@
HTMLOUTDIR = $(top_builddir)/@top_HTMLOUTDIR@

baselist = \
	280003/281000/k302RG00001279 \
	280003/281000/k302RG00001524

SRCS  = $(addprefix $(XMLDATADIR)/, $(addsuffix .xml,  $(baselist)))
DESTS = $(addprefix $(HTMLOUTDIR)/, $(addsuffix .html, $(baselist)))

SUFFIXES = .xml .html
.xml.html:
	$(MKDIR_P) $(dir $@)
	$(XSLTPROC) --output $@ $(XMLDATADIR)/egovproc.xsl $<

all: $(DESTS)

-include Makefile.sub
Makefile.sub: $(top_srcdir)/bin/submake.sh $(top_builddir)/config.log
	@$(SHELL) $(top_srcdir)/bin/submake.sh $(baselist)
