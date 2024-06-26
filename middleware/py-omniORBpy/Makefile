# robotpkg Makefile for:	middleware/py-omniORBpy
# Created:			Anthony Mallet on Tue, 6 Mar 2007
#

DISTNAME=		omniORBpy-4.3.2
PKGNAME=		${PKGTAG.python-}${DISTNAME}
CATEGORIES=		middleware
MASTER_SITES=		${MASTER_SITE_SOURCEFORGE:=omniorb/}
EXTRACT_SUFX?=		.tar.bz2

MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		http://omniorb.sourceforge.net/
COMMENT=		Robust high-performance CORBA ORB for Python
LICENSE=		gnu-lgpl-v2.1

# Old package name and other Python versions
CONFLICTS=		omniORBpy-[0-9]*
CONFLICTS+=		py[0-9][0-9]-omniORBpy-[0-9]*

MAKE_FILE=		GNUmakefile
GNU_CONFIGURE=		yes
CONFIGURE_ARGS+=	--with-omniorb=${PREFIX.omniORB}
CONFIGURE_ARGS+=	am_cv_python_pythondir=${PREFIX}/${PYTHON_SITELIB}
CONFIGURE_ARGS+=	am_cv_python_pyexecdir=${PREFIX}/${PYTHON_SITELIB}
CONFIGURE_ARGS+=	PYTHON=${PYTHON}

# Need to be in sync with middleware/omniORB
PREFER.omniORB?=	robotpkg
DEPEND_ABI.omniORB+=	omniORB>=4.3<4.4

include ../../middleware/omniORB/depend.mk
include ../../mk/sysdep/automake.mk
include ../../mk/sysdep/python.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk

# config.{guess,sub} are outdated for some recent architectures (aarch64).
# autoreconf < 2.70 does not update those files, so cherry-pick those from
# automake. Of course, this would be easier if omniORB distributions had
# them updated.
#
pre-configure:
	${RUN}${STEP_MSG} "Updating automake files";			\
	libdir=`${AUTOMAKE} --print-libdir`;				\
	for f in config.guess config.sub; do				\
	  ${CP} -p "$$libdir/$$f" ${WRKSRC}/bin/scripts/.;		\
	done
