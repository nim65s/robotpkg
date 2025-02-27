# robotpkg sysdep/qt5-quickcontrols2
# Created: Anthony Mallet on Thu, 27 Feb 2025
#
DEPEND_DEPTH:=			${DEPEND_DEPTH}+
QT5_QUICKCONTROLS2_DEPEND_MK:=	${QT5_QUICKCONTROLS2_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		qt5-quickcontrols2
endif

ifeq (+,$(QT5_QUICKCONTROLS2_DEPEND_MK)) # ---------------------------------

PREFER.qt5-quickcontrols2?=	system

DEPEND_USE+=			qt5-quickcontrols2
DEPEND_ABI.qt5-quickcontrols2?=	qt5-quickcontrols2>=5.0.0

SYSTEM_SEARCH.qt5-quickcontrols2=\
  'include/{,qt5/}QtQuickControls2/qtquickcontrols2version.h'	\
  'lib/libQt5QuickControls2.so'					\
  'lib/pkgconfig/Qt5QuickControls2.pc:/Version/s/[^0-9.]//gp'

SYSTEM_PREFIX.qt5-quickcontrols2?=${SYSTEM_PREFIX:=/qt5} ${SYSTEM_PREFIX}

SYSTEM_PKG.Debian.qt5-quickcontrols2=	qtquickcontrols2-5-dev
SYSTEM_PKG.Fedora.qt5-quickcontrols2=	qt5-qtquickcontrols2-devel
SYSTEM_PKG.NetBSD.qt5-quickcontrols2=	x11/qt5-qtquickcontrols2

endif # QT5_QUICKCONTROLS2_DEPEND_MK ---------------------------------------

DEPEND_DEPTH:= ${DEPEND_DEPTH:+=}
