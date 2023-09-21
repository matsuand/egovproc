#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.
#
# This is part of eGovproc package.
#
#              Written by matsuand
#

AC_PREREQ([2.71])
AC_INIT([egovproc], [0.0.1], [])
AM_INIT_AUTOMAKE([-Wno-portability])

m4_include([m4/progs.m4])

# Checks for programs.
AC_PROG_MKDIR_P
AC_PROG_XSLTPROC

# Checks for libraries.

# Checks for header files.

# Checks for typedefs, structures, and compiler characteristics.

# Checks for library functions.

top_XMLDATADIR=data
top_HTMLOUTDIR=docs
AC_SUBST(top_XMLDATADIR)
AC_SUBST(top_HTMLOUTDIR)

AC_CONFIG_FILES([
	Makefile
	data/Makefile
	data/xml/Makefile])
AC_OUTPUT
