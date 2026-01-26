# robotpkg Makefile for:	math/py27-quadprog
# Created:			Guilhem Saurel on Tue, 14 Apr 2020
#

ORG=			rmcgibbo
PYPI_PATH=		9e/60/fb9b56d425c5b3495bb92683c28f954aedb609ae62f14c81a1b5621ad759/
VERSION=		0.1.13
DISTNAME=		quadprog-${VERSION}
PKGNAME=		${PKGTAG.python-}quadprog-${VERSION}
MASTER_SITES=		https://files.pythonhosted.org/packages/${PYPI_PATH}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_GITHUB}${ORG}/quadprog.git

CATEGORIES=		math
HOMEPAGE=		${MASTER_SITE_GITHUB:=${ORG}/quadprog}
COMMENT=		Solve a strictly convex quadratic program
LICENSE=		gnu-gpl-v2
MAINTAINER=		gsaurel@laas.fr

MAKE_ENV+=		PYTHONPATH=${PREFIX}/${PYTHON_SITELIB}

include ../../mk/sysdep/py-cython.mk
include ../../mk/sysdep/py-numpy.mk
include ../../mk/sysdep/py-setuptools.mk
include ../../mk/sysdep/python.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
