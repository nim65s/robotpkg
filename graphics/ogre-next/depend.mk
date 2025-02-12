# robotpkg depend.mk for:	graphics/ogre-next
# Created:			Anthony Mallet on Wed, 12 Feb 2025
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
OGRE_NEXT_DEPEND_MK:=		${OGRE_NEXT_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			ogre-next
endif

ifeq (+,$(OGRE_NEXT_DEPEND_MK)) # ------------------------------------------

include ../../mk/robotpkg.prefs.mk # for OPSYS
ifeq (Ubuntu,${OPSYS})
  ifneq (,$(filter 18.04% 20.04% 22.04%,${OS_VERSION}))
    PREFER.ogre-next?=	robotpkg
  endif
  PREFER.ogre-next?=	system
endif
PREFER.ogre-next?=	robotpkg

DEPEND_USE+=		ogre-next

DEPEND_ABI.ogre-next?=		ogre-next>=2
DEPEND_DIR.ogre-next?=		../../graphics/ogre-next

SYSTEM_SEARCH.ogre-next=\
  'include/OGRE-{Next,[0-9]*}/Ogre.h'	\
  'lib/libOgre{Next,}Main.so'	\
  'lib/pkgconfig/OGRE-{Next,[0-9]*}.pc:/Version/s/[^0-9.]//gp'

endif # OGRE_NEXT_DEPEND_MK ------------------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
