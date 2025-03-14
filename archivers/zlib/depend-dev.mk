# robotpkg depend.mk for:	archivers/zlib
# Created:			Anthony Mallet on Sat, 19 Apr 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
ZLIB_DEV_DEPEND_MK:=	${ZLIB_DEV_DEPEND_MK}+

ifeq (+,$(ZLIB_DEV_DEPEND_MK)) # -----------------------------------------

PREFER.zlib-dev?=		system

DEPEND_ABI.zlib-dev?=	zlib>=1.2.3
DEPEND_DIR.zlib-dev?=	../../archivers/zlib

SYSTEM_PKG.Fedora.zlib-dev=	zlib-devel
SYSTEM_PKG.Ubuntu.zlib-dev=	zlib1g-dev
SYSTEM_PKG.Debian.zlib-dev=	zlib1g-dev
SYSTEM_PKG.Gentoo.zlib-dev=	sys-libs/zlib

SYSTEM_SEARCH.zlib-dev=\
	'include/zlib.h:/define ZLIB_VERSION/s/[^0-9.]//gp'	\
	include/zconf.h						\

  # pull-in the user preferences for zlib now
  include ../../mk/robotpkg.prefs.mk

  ifeq (inplace+robotpkg,$(strip $(ZLIB_STYLE)+$(PREFER.zlib)))
  # This is the "inplace" version of zlib package, for bootstrap process
  #
ZLIB_FILESDIR=	${ROBOTPKG_DIR}/archivers/zlib/dist
ZLIB_SRCDIR=	${WRKDIR}/zlib

CPPFLAGS+=	-I${ZLIB_SRCDIR}
LDFLAGS+=	-L${ZLIB_SRCDIR}
LIBS+=		-lz

post-extract: zlib-extract
zlib-extract:
	@${STEP_MSG} "Extracting zlib in place"
	${CP} -Rp ${ZLIB_FILESDIR} ${ZLIB_SRCDIR}

pre-configure: zlib-build
zlib-build:
	@${STEP_MSG} "Building zlib in place"
	${RUN}								\
	cd ${ZLIB_SRCDIR} && 						\
	${SETENV} AWK="${AWK}" CC="${CC}" CFLAGS="${CFLAGS} ${CPPFLAGS}"\
		${MAKE_PROGRAM} libz.a
  else
  # This is the regular version of zlib package, for normal install
  #
DEPEND_USE+=		zlib-dev
  endif

endif # ZLIB_DEV_DEPEND_MK -----------------------------------------------

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		$(filter zlib-dev,${DEPEND_USE})
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
