# robotpkg depend.mk for:	graphics/py-qt-hpp-plot
# Created:			Guilhem Saurel on Tue, 26 Feb 2019
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
PY_QT_HPP_PLOT_DEPEND_MK:=	${PY_QT_HPP_PLOT_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		py-qt-hpp-plot
endif

ifeq (+,$(PY_QT_HPP_PLOT_DEPEND_MK)) # ----------------------------------------

PREFER.py-qt-hpp-plot?=	robotpkg

DEPEND_USE+=		py-qt-hpp-plot

# depend on appropriate Qt version when using Qt, all versions otherwise.
_hppp_qts={qt4,qt5}
_hppp_qt=\
  $(if $(filter qt,${PKG_ALTERNATIVES}),${PKG_ALTERNATIVE.qt},${_hppp_qts})

DEPEND_ABI.py-qt-hpp-plot?=	${PKGTAG.python-}${_hppp_qt}-hpp-plot>=4.6.0
DEPEND_DIR.py-qt-hpp-plot?=	../../graphics/py-qt-hpp-plot

SYSTEM_SEARCH.py-qt-hpp-plot=\
  'include/hpp/plot/config.hh'	\
  'lib/libhpp-plot.so'	\
  'lib/pkgconfig/hpp-plot.pc:/Version/s/[^0-9.]//gp'

include ../../graphics/py-qt-hpp-gepetto-viewer/depend.mk
include ../../graphics/qt-qgv/depend.mk
include ../../path/py-hpp-manipulation-corba/depend.mk

endif # PY_QT_HPP_PLOT_DEPEND_MK ----------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
