# robotpkg sysdep/jsoncpp.mk
# Created:			Anthony Mallet on Tue, 18 Oct 2011
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
JSONCPP_DEPEND_MK:=	${JSONCPP_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		jsoncpp
endif

ifeq (+,$(JSONCPP_DEPEND_MK)) # --------------------------------------------

PREFER.jsoncpp?=	system

DEPEND_USE+=		jsoncpp

DEPEND_ABI.jsoncpp?=	jsoncpp>=1

SYSTEM_SEARCH.jsoncpp=\
  'include/{,jsoncpp/}json/json.h'		\
  'lib/libjsoncpp.so'				\
  'lib/cmake/jsoncpp/jsoncppConfig.cmake'	\
  'lib/pkgconfig/jsoncpp.pc:/Version/s/[^.0-9]//gp'

SYSTEM_PKG.Debian.jsoncpp=libjsoncpp-dev
SYSTEM_PKG.RedHat.jsoncpp=jsoncpp-devel
SYSTEM_PKG.NetBSD.jsoncpp=textproc/jsoncpp

endif # JSONCPP_DEPEND_MK --------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
