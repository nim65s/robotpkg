# $LAAS: ncurses.mk 2009/10/21 22:45:51 tho $
#
# Copyright (c) 2009 LAAS/CNRS
# All rights reserved.
#
# Permission to use, copy, modify, and distribute this software for any purpose
# with or without   fee is hereby granted, provided   that the above  copyright
# notice and this permission notice appear in all copies.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH
# REGARD TO THIS  SOFTWARE INCLUDING ALL  IMPLIED WARRANTIES OF MERCHANTABILITY
# AND FITNESS. IN NO EVENT SHALL THE AUTHOR  BE LIABLE FOR ANY SPECIAL, DIRECT,
# INDIRECT, OR CONSEQUENTIAL DAMAGES OR  ANY DAMAGES WHATSOEVER RESULTING  FROM
# LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR
# OTHER TORTIOUS ACTION,   ARISING OUT OF OR IN    CONNECTION WITH THE USE   OR
# PERFORMANCE OF THIS SOFTWARE.
#
#                                             Anthony Mallet on Thu Apr  2 2009
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
NCURSES_DEV_DEPEND_MK:=	${NCURSES_DEV_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		ncurses-dev
endif

ifeq (+,$(NCURSES_DEV_DEPEND_MK)) # --------------------------------------------

PREFER.ncurses-dev?=	system

DEPEND_USE+=		ncurses-dev
DEPEND_ABI.ncurses-dev?=	ncurses-dev>=5

SYSTEM_PKG.Fedora.ncurses-dev=	ncurses-devel
SYSTEM_PKG.Ubuntu.ncurses-dev=	libncurses-dev
SYSTEM_PKG.NetBSD.ncurses-dev=		pkgsrc/devel/ncurses

SYSTEM_SEARCH.ncurses-dev=\
	'include/{ncurses/,}ncurses.h:/NCURSES_VERSION[ 	]/s/[^0-9.]//gp'


endif # NCURSES_DEV_DEPEND_MK --------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
