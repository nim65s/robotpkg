# robotpkg sysdep/qt5-graphicaleffects
# Created: Anthony Mallet on Mon, 10 Mar 2025
#
DEPEND_DEPTH:=			${DEPEND_DEPTH}+
QT5_GRAPHICALEFFECTS_DEPEND_MK:=${QT5_GRAPHICALEFFECTS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			qt5-graphicaleffects
endif

ifeq (+,$(QT5_GRAPHICALEFFECTS_DEPEND_MK)) # -------------------------------

PREFER.qt5-graphicaleffects?=	system

DEPEND_USE+=			qt5-graphicaleffects
DEPEND_ABI.qt5-graphicaleffects?=qt5-graphicaleffects

SYSTEM_SEARCH.qt5-graphicaleffects=\
  '{lib/qt5/,}qml/QtGraphicalEffects/GaussianBlur.qml'		\
  '{lib/qt5/,}qml/QtGraphicalEffects/libqtgraphicaleffectsplugin.so'

SYSTEM_PREFIX.qt5-graphicaleffects?=${SYSTEM_PREFIX:=/qt5} ${SYSTEM_PREFIX}

SYSTEM_PKG.Debian.qt5-graphicaleffects=	qml-module-qtgraphicaleffects
SYSTEM_PKG.Fedora.qt5-graphicaleffects=	qt5-qtgraphicaleffects-devel
SYSTEM_PKG.NetBSD.qt5-graphicaleffects=	x11/qt5-qtgraphicaleffects

endif # QT5_GRAPHICALEFFECTS_DEPEND_MK -------------------------------------

DEPEND_DEPTH:= ${DEPEND_DEPTH:+=}
