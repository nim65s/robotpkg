# robotpkg Makefile for:	interfaces/gz-msgs
# Created:			Anthony Mallet on Fri,  7 Feb 2025
#

DISTNAME=	gz-msgs-11.0.0

GZ_COMMENT=	messages and functions
CATEGORIES=	interfaces

include ../../simulation/gz-sim/Makefile.common

CMAKE_ARGS+=	-DGZ_PYTHON_INSTALL_PATH=${PREFIX}/${PYTHON_SITELIB}

# Replace python interpreter
SUBST_CLASSES+=		py-interp
SUBST_FILES.py-interp+=\
  tools/gz_msgs_generate.py		\
  tools/gz_msgs_generate_factory.py

# Workaround a conflict with major(3) and minor(3) macros on NetBSD.
#
# The version.proto message contains major/minor fields, that are converted to
# C++ class methods int32_t major()/minor() by protobuf. This fails to compile
# on NetBSD due to major(3) and minor(3) defined as macros in sys/types.h.
# Enabling _POSIX_SOURCE deactivate those macros and should not hurt on other
# systems anyway.
CPPFLAGS+= -D_POSIX_SOURCE=1

include ../../math/gz-math/depend.mk
include ../../sysutils/gz-tools/depend.mk
include ../../mk/sysdep/protobuf.mk
include ../../mk/sysdep/python.mk
include ../../mk/sysdep/tinyxml2.mk
include ../../mk/robotpkg.mk
