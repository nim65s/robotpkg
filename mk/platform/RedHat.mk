#
# Variable definitions for the RedHat operating system.
#

# System library directories
ifeq (${MACHINE_ARCH},x86_64)	# 64bits arch
  # redhat uses lib64 even on 64bits systems, but some stuff remains in lib
  SYSLIBDIR?=	lib64 lib
endif

# system packages built with rpmbuild have package-note flags in their linker
# LDFLAGS, which can too easily leak from installed packages as a spurious
# -specs=/usr/lib/rpm/redhat/redhat-package-notes (typically via Qt and Tcl
# config files, but also through many others). These flags reference RPM_ARCH
# and other RPM variables, and when the build is executed outside an rpmbuild
# context, this obviously fails.
# The required variables are therefore provided here with ad-hoc values:
export RPM_ARCH=		${MACHINE_ARCH}
export RPM_PACKAGE_RELEASE=	${PKGREVISION}
export RPM_PACKAGE_VERSION=	${PKGREVISION_NOREV}
export RPM_PACKAGE_NAME=	robotpkg-${PKGBASE}

include ${ROBOTPKG_DIR}/mk/platform/Linux.mk
