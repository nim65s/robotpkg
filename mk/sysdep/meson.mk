# robotpkg mk/sysdep/meson.mk
# Created:		Guilhem Saurel on Mon, 29 Aug 2022
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
MESON_DEPEND_MK:=	${MESON_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		meson
endif

ifeq (+,$(MESON_DEPEND_MK)) # ------------------------------------------------

PREFER.meson?=		system
DEPEND_USE+=		meson
DEPEND_ABI.meson?=	meson>=0.54
DEPEND_METHOD.meson+=	build

USE_MESON?=		yes

SYSTEM_SEARCH.meson=	\
    'bin/meson:p:% --version'

export MESON=		${PREFIX.meson}/bin/meson

SYSTEM_PKG.Arch.meson=		meson
SYSTEM_PKG.Debian.meson=	meson

endif # MESON_DEPEND_MK ------------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
