# robotpkg			sysdep/cereal.mk
# Created:			Guilhem Saurel on Mon, 27 Oct 2025
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
CEREAL_DEPEND_MK:=		${CEREAL_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			cereal
endif

ifeq (+,$(CEREAL_DEPEND_MK)) # ---------------------------------------------

PREFER.cereal?=			system

DEPEND_USE+=			cereal

DEPEND_METHOD.cereal?=		build
DEPEND_ABI.cereal?=		cereal>=1

SYSTEM_SEARCH.cereal=		\
  'include/cereal/cereal.hpp'	\
  'lib/cmake/cereal/cerealConfigVersion.cmake:/set.PACKAGE_VERSION/s/[^0-9.]//gp'

SYSTEM_PKG.Debian.cereal=	libcereal-dev
SYSTEM_PKG.NetBSD.cereal=	wip/cereal
SYSTEM_PKG.RedHat.cereal=	cereal-devel

endif # CEREAL_DEPEND_MK ---------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
