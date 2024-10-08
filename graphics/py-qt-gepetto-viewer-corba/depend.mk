# robotpkg depend.mk for:	graphics/py-qt-gepetto-viewer-corba
# Created:			Florent Lamiraux on Sun, 8 Mar 2015
#

DEPEND_DEPTH:=				${DEPEND_DEPTH}+
PY_QT_GEPETTO_VIEWER_CORBA_DEPEND_MK:=	${PY_QT_GEPETTO_VIEWER_CORBA_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=				py-qt-gepetto-viewer-corba
endif

ifeq (+,$(PY_QT_GEPETTO_VIEWER_CORBA_DEPEND_MK)) # -------------------------

PREFER.py-qt-gepetto-viewer-corba?=	robotpkg

DEPEND_USE+=				py-qt-gepetto-viewer-corba

DEPEND_ABI.py-qt-gepetto-viewer-corba?=\
  ${PKGTAG.python}-${PKGTAG.qt}-gepetto-viewer-corba>=5.6.0
DEPEND_DIR.py-qt-gepetto-viewer-corba?=\
  ../../graphics/py-qt-gepetto-viewer-corba

SYSTEM_SEARCH.py-qt-gepetto-viewer-corba=\
  'include/gepetto/viewer/corba/config.hh:/GEPETTO_VIEWER_CORBA_VERSION /s/[^0-9.]//gp' \
  'lib/cmake/gepetto-viewer-corba/gepetto-viewer-corbaConfigVersion.cmake:/PACKAGE_VERSION/s/[^0-9.]//gp' \
  'lib/libgepetto-viewer-corba.so'					\
  'lib/pkgconfig/gepetto-viewer-corba.pc:/Version/s/[^0-9.]//gp'	\
  'share/gepetto-viewer-corba/package.xml:/<version>/s/[^0-9.]//gp'

# propagate qt requirements
include ../../graphics/py-qt-gepetto-viewer/depend.mk

include ../../mk/sysdep/python.mk
include ../../mk/sysdep/qt.mk

endif # PY_QT_GEPETTO_VIEWER_CORBA_DEPEND_MK -------------------------------

DEPEND_DEPTH:=				${DEPEND_DEPTH:+=}
