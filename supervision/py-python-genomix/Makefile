# robotpkg Makefile for:	supervision/tcl-genomix
# Created:			Anthony Mallet on Fri, 19 Oct 2012
#

PKGNAME=	${PKGTAG.python-}${DISTNAME}
DISTNAME=	python-genomix-1.1
CATEGORIES=	supervision
MASTER_SITES=	${MASTER_SITE_OPENROBOTS:=python-genomix/}
MASTER_REPOSITORY= ${MASTER_REPOSITORY_OPENROBOTS}genomix/python-genomix
DISTFILES=	python-genomix-1.1p1.tar.gz

MAINTAINER=	mallet@laas.fr
HOMEPAGE=	https://git.openrobots.org/projects/python-genomix
COMMENT=	Interactive python client for controlling GenoM3 components

LICENSE=	2-clause-bsd

GNU_CONFIGURE=	yes

DEPEND_ABI.python=	python>=3.5

include ../../mk/sysdep/python.mk
include ../../mk/robotpkg.mk
