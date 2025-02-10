# robotpkg depend.mk for:	simulation/libdart
# Created:			Anthony Mallet on Mon, 10 Feb 2025
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LIBDART_DEPEND_MK:=	${LIBDART_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		libdart
endif

ifeq (+,$(LIBDART_DEPEND_MK)) # --------------------------------------------

include ../../mk/robotpkg.prefs.mk # for OPSYS
ifeq (Debian,${OPSYS})
  PREFER.libdart?=	system
else ifeq (Ubuntu,${OPSYS})
  PREFER.libdart?=	system
endif
PREFER.libdart?=	robotpkg

DEPEND_USE+=		libdart

DEPEND_ABI.libdart?=	libdart>=2.0
DEPEND_DIR.libdart?=	../../simulation/libdart

SYSTEM_SEARCH.libdart=\
  'include/dart/dart.hpp'				\
  'include/dart/collision/bullet/bullet.hpp'		\
  'include/dart/collision/ode/ode.hpp'			\
  'include/dart/utils/urdf/urdf.hpp'			\
  'include/dart/utils/utils.hpp'			\
  'lib/libdart-collision-bullet.so'			\
  'lib/libdart-collision-ode.so'			\
  'lib/libdart-utils-urdf.so'				\
  'lib/libdart-utils.so'				\
  'lib/libdart.so'					\
  'share/dart/cmake/DARTConfig.cmake'			\
  'lib/pkgconfig/dart.pc:/Version/s/[^0-9.]//gp'

SYSTEM_PKG.Debian.libdart= libdart-all-dev

endif # LIBDART_DEPEND_MK --------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
