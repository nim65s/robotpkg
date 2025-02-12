# robotpkg sysdep/rapidjson.mk
# Created:			Anthony Mallet on Wed, 12 Feb 2025
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
RAPIDJSON_DEPEND_MK:=	${RAPIDJSON_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		rapidjson
endif

ifeq (+,$(RAPIDJSON_DEPEND_MK)) # ------------------------------------------

PREFER.rapidjson?=	system

DEPEND_USE+=		rapidjson

DEPEND_ABI.rapidjson?=	rapidjson>=1

SYSTEM_SEARCH.rapidjson=\
  'include/rapidjson/rapidjson.h'			\
  '{lib,share}/cmake/RapidJSON/RapidJSONConfig.cmake'	\
  '{lib,share}/pkgconfig/RapidJSON.pc:/Version/s/[^0-9.]//gp'

SYSTEM_PKG.Fedora.rapidjson=	rapidjson-devel
SYSTEM_PKG.Debian.rapidjson=	rapidjson-dev
SYSTEM_PKG.NetBSD.rapidjson=	textproc/rapidjson

endif # RAPIDJSON_DEPEND_MK ------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
