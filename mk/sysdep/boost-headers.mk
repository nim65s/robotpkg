# robotpkg sysdep/boost-headers.mk
# Created:			Anthony Mallet on Fri, 10 Oct 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
BOOST_HEADERS_DEPEND_MK:=${BOOST_HEADERS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		boost-headers
endif

ifeq (+,$(BOOST_HEADERS_DEPEND_MK)) # --------------------------------

PREFER.boost?=		system
PREFER.boost-headers?=	${PREFER.boost}

SYSTEM_PKG.Ubuntu.boost-headers=	libboost-dev
SYSTEM_PKG.RedHat.boost-headers=	boost-devel
SYSTEM_PKG.Debian.boost-headers=	libboost-dev
SYSTEM_PKG.NetBSD.boost-headers=	pkgsrc/devel/boost-headers
SYSTEM_PKG.Arch.boost-headers=	boost

SYSTEM_SEARCH.boost-headers=\
  'include/boost/version.hpp:/BOOST_LIB_VERSION.*"/{s/.*"\([0-9_]*\)".*/\1/g;y/_/./;p;}'	\
  'include/boost/config.hpp'	\
  'include/boost/config/user.hpp'

DEPEND_USE+=			boost-headers

DEPEND_ABI.boost-headers?=	boost-headers>=1.34.1

DEPEND_METHOD.boost-headers?=	build

# For cmake/FindBoost users
CMAKE_ARGS+=	'-DBOOST_INCLUDEDIR=${PREFIX.boost-headers:=/include}'

include ../../mk/language/c++.mk

endif # BOOST_HEADERS_DEPEND_MK --------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
