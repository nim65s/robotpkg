#
# Copyright (c) 2009-2013,2022 LAAS/CNRS
# All rights reserved.
#
# Redistribution and use  in source  and binary  forms,  with or without
# modification, are permitted provided that the following conditions are
# met:
#
#   1. Redistributions of  source  code must retain the  above copyright
#      notice, this list of conditions and the following disclaimer.
#   2. Redistributions in binary form must reproduce the above copyright
#      notice,  this list of  conditions and the following disclaimer in
#      the  documentation  and/or  other   materials provided  with  the
#      distribution.
#
# THIS  SOFTWARE IS PROVIDED BY  THE  COPYRIGHT HOLDERS AND CONTRIBUTORS
# "AS IS" AND  ANY  EXPRESS OR IMPLIED  WARRANTIES,  INCLUDING,  BUT NOT
# LIMITED TO, THE IMPLIED WARRANTIES  OF MERCHANTABILITY AND FITNESS FOR
# A PARTICULAR  PURPOSE ARE DISCLAIMED. IN  NO EVENT SHALL THE COPYRIGHT
# HOLDERS OR      CONTRIBUTORS  BE LIABLE FOR   ANY    DIRECT, INDIRECT,
# INCIDENTAL,  SPECIAL,  EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
# BUT NOT LIMITED TO, PROCUREMENT OF  SUBSTITUTE GOODS OR SERVICES; LOSS
# OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
# ON ANY THEORY OF LIABILITY, WHETHER IN  CONTRACT, STRICT LIABILITY, OR
# TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE
# USE   OF THIS SOFTWARE, EVEN   IF ADVISED OF   THE POSSIBILITY OF SUCH
# DAMAGE.
#
#                                      Anthony Mallet on Thu Jan 22 2009
#

include ${ROBOTPKG_DIR}/mk/sysdep/meson.mk
include ${ROBOTPKG_DIR}/mk/sysdep/ninja.mk
include ${ROBOTPKG_DIR}/mk/sysdep/python.mk

MESON_ARGS?=#	empty
BUILD_DEFS+=	MESON_ARGS

MESON_CONFIGURE_PREFIX?=${PREFIX}

MESON_ARGS+=	--prefix=${MESON_CONFIGURE_PREFIX}
MESON_ARGS+=	-Dbuildtype=$(if $(filter debug,${PKG_OPTIONS}),debug,release)
MESON_ARGS+=	-Dc_link_args=$(call quote,${LDFLAGS})
MESON_ARGS+=	-Dcpp_link_args=$(call quote,${LDFLAGS})

# C flags
MESON_ARGS+=\
  $(if $(filter c-compiler,${PKG_ALTERNATIVES}),		\
    -Dc_args=$(call quote,${CPPFLAGS} ${CFLAGS}))

# C++ flags
MESON_ARGS+=\
  $(if $(filter c++-compiler,${PKG_ALTERNATIVES}),		\
    -Dcpp_args=$(call quote,${CPPFLAGS} ${CXXFLAGS}))

# Handle PKGINFODIR
ifneq (,$(call isyes,${CONFIGURE_HAS_INFODIR}))
  MESON_ARGS+=	-Dinfodir=${PKGINFODIR}
endif

# Handle PKGMANDIR
ifneq (,$(call isyes,${CONFIGURE_HAS_MANDIR}))
  MESON_ARGS+=	-Dmandir=${PKGMANDIR}
endif


# --- do-configure-meson (PRIVATE) -----------------------------------------
#
# do-configure-meson runs the meson program to configure the software for
# building.
#
_CONFIGURE_MESON_ENV+=	${CONFIGURE_ENV}

DO_CONFIGURE_TARGET?=	do-configure-meson(${CONFIGURE_DIRS})

.PHONY: do-configure-meson()
do-configure-meson(%): .FORCE
	${RUN}								\
	cd ${WRKSRC} && cd '$%' &&					\
	${SETENV} ${_CONFIGURE_MESON_ENV}				\
	  ${MESON} ${MESON_ARGS} build
