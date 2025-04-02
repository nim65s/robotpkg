# robotpkg sysdep/nlohmann-json.mk
# Created:			Anthony Mallet on Wed, 2 Apr 2025
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
NLOHMANN_JSON_DEPEND_MK:=	${NLOHMANN_JSON_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			nlohmann-json
endif

ifeq (+,$(NLOHMANN_JSON_DEPEND_MK)) # --------------------------------------

PREFER.nlohmann-json?=		system

DEPEND_USE+=			nlohmann-json

DEPEND_METHOD.nlohmann-json?=	build
DEPEND_ABI.nlohmann-json?=	nlohmann-json>=3

SYSTEM_SEARCH.nlohmann-json=	\
  'include/nlohmann/json.hpp'					\
  '{share,lib}/cmake/nlohmann_json/nlohmann_jsonConfig.cmake'	\
  '{share,lib}/pkgconfig/nlohmann_json.pc:/Version/s/[^0-9.]//gp'

SYSTEM_PKG.Debian.nlohmann-json=	nlohmann-json3-dev
SYSTEM_PKG.RedHat.nlohmann-json=	json-devel
SYSTEM_PKG.NetBSD.nlohmann-json=	textproc/nlohmann-json

endif # NLOHMANN_JSON_DEPEND_MK --------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
