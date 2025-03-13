# $LAAS: termcap.mk 2009/09/23 18:57:00 mallet $
#
# Copyright (c) 2008-2009 LAAS/CNRS
# All rights reserved.
#
# Redistribution and use  in source  and binary  forms,  with or without
# modification, are permitted provided that the following conditions are
# met:
#
#   1. Redistributions of  source  code must retain the  above copyright
#      notice and this list of conditions.
#   2. Redistributions in binary form must reproduce the above copyright
#      notice and  this list of  conditions in the  documentation and/or
#      other materials provided with the distribution.
#
#                                      Anthony Mallet on Sat Nov  1 2008
#

# This Makefile fragment is meant to be included by packages that require
# a termcap implementation that supports the basic termcap functions:
#
#	tgetent, tgetstr, tgetflag, tgetnum, tgoto, tputs
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
TERMCAP_DEV_DEPEND_MK:=	${TERMCAP_DEV_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		termcap-dev
endif

ifeq (+,$(TERMCAP_DEV_DEPEND_MK)) # --------------------------------------

PREFER.termcap-dev?=	system

DEPEND_USE+=		termcap-dev
DEPEND_ABI.termcap-dev?=	termcap-dev

SYSTEM_DESCR.termcap-dev=	"curses, ncurses, termlib or termcap"

SYSTEM_PKG.Fedora.termcap-dev=	"ncurses-devel"
SYSTEM_PKG.Ubuntu.termcap-dev=	"libncurses-dev"
SYSTEM_PKG.Debian.termcap-dev=	"libncurses-dev"
SYSTEM_PKG.NetBSD.termcap-dev=		"pkgsrc/devel/ncurses"

SYSTEM_SEARCH.termcap-dev=\
	'include/{term,termcap,termlib}.h'


endif # TERMCAP_DEV_DEPEND_MK --------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
