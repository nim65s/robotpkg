# robotpkg Makefile for:	middleware/fastrtps
# Created:			Anthony Mallet on Mon, 11 Apr 2022
#

VERSION=	3.6.1
PKGNAME=	fastdds-${VERSION}
DISTNAME=	Fast-DDS-${VERSION}
MASTER_SITES=	${MASTER_SITE_GITHUB:=eProsima/}
GITHUB_TAG=	v${VERSION}

COMMENT=	Implementation of the Data Distribution Service (DDS) standard.
CATEGORIES=	middleware
CONFLICTS+=	fastrtps-[0-9]*

ROS2_AMENTPKG=	no
include ../../meta-pkgs/ros2-core/Makefile.common

CMAKE_ARGS+=	-DTHIRDPARTY_UPDATE=OFF
CMAKE_ARGS+=	-DTHIRDPARTY_Asio=OFF
CMAKE_ARGS+=	-DTHIRDPARTY_TinyXML2=OFF

SUBST_CLASSES+=	py-interp
SUBST_FILES.py-interp=\
  tools/fastdds/fastdds		\
  tools/fastdds/fastdds.py	\
  tools/fastdds/ros-discovery

PYTHON_PLIST_COMPILE_PATTERN=\
  /libexec[\/].*[.]py$$/

PKG_SUPPORTED_OPTIONS+=	doc
PKG_OPTION_DESCR.doc=	Enable documentation generation and installation
define PKG_OPTION_SET.doc
  CMAKE_ARGS+=\
    -DBUILD_DOCUMENTATION=TRUE	\
    -DCHECK_DOCUMENTATION=TRUE	\
    -DDOC_INSTALL_DIR=${PREFIX}/share/doc/${PKGBASE}
  DYNAMIC_PLIST_DIRS+=	share/doc/${PKGBASE}

  include ../../mk/sysdep/doxygen.mk
endef

DEPEND_ABI.asio= asio>=1.13
DEPEND_ABI.cmake= cmake>=3.22
DEPEND_ABI.python+= python>=3.6

include ../../devel/asio/depend.mk
include ../../devel/foonathan-memory/depend.mk
include ../../middleware/fastcdr/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/openssl.mk
include ../../mk/sysdep/python.mk
include ../../mk/sysdep/tinyxml2.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk

post-extract:
	${RUN}${CP} ${FILESDIR}/bsd.hpp	\
	  ${WRKSRC}/thirdparty/boost/include/boost/config/platform/.
