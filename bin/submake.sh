#!/bin/sh

srclist=$@

rm -f Makefile.sub
echo "#"              >Makefile.sub
echo "# Makefile.sub">>Makefile.sub
echo "#"             >>Makefile.sub

for f in $srclist; do
    ff=`echo $f | sed 's/^\.\///'`
    ext=`echo $ff | sed 's/^.*\.\([^\.]*\)$/\1/'`
    base=`echo $ff | sed "s/\.[^\.]*$//"`
    echo "\$(HTMLOUTDIR)/$base.html: \$(srcdir)/$base.xml \$(XMLDATADIR)/egovproc.xsl">>Makefile.sub
    echo "	@\$(MKDIR_P) \$(dir $ff)">>Makefile.sub
    echo "	@echo Processing $ff...">>Makefile.sub
    echo "	@\$(XSLTPROC) --output \$@ \$(XMLDATADIR)/egovproc.xsl \$< >/dev/null">>Makefile.sub
done
