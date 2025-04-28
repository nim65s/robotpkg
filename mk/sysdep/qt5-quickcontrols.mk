# robotpkg sysdep/qt5-quickcontrols
# Created: Anthony Mallet on Thu, 27 Feb 2025
#
DEPEND_DEPTH:=			${DEPEND_DEPTH}+
QT5_QUICKCONTROLS_DEPEND_MK:=	${QT5_QUICKCONTROLS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			qt5-quickcontrols
endif

ifeq (+,$(QT5_QUICKCONTROLS_DEPEND_MK)) # ----------------------------------

PREFER.qt5-quickcontrols?=	system

DEPEND_USE+=			qt5-quickcontrols
DEPEND_ABI.qt5-quickcontrols?=	qt5-quickcontrols

SYSTEM_SEARCH.qt5-quickcontrols=\
  '{lib/qt5/,}qml/QtQuick/Controls/ApplicationWindow.qml'	\
  '{lib/qt5/,}qml/QtQuick/Dialogs/WidgetMessageDialog.qml'	\
  '{lib/qt5/,}qml/QtQuick/Controls/libqtquickcontrolsplugin.so'

SYSTEM_PREFIX.qt5-quickcontrols?=${SYSTEM_PREFIX:=/qt5} ${SYSTEM_PREFIX}

SYSTEM_PKG.Debian.qt5-quickcontrols=	qml-module-qtquick-controls \
					qml-module-qtquick-dialogs
SYSTEM_PKG.Fedora.qt5-quickcontrols=	qt5-qtquickcontrols
SYSTEM_PKG.NetBSD.qt5-quickcontrols=	x11/qt5-qtquickcontrols

endif # QT5_QUICKCONTROLS_DEPEND_MK ----------------------------------------

DEPEND_DEPTH:= ${DEPEND_DEPTH:+=}
