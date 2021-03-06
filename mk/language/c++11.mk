# robotpkg language/c++11.mk
# Created:			Anthony Mallet on Tue, 4 Sep 2018
#
ifndef _language_c++11_mk
_language_c++11_mk:=defined

include ../../mk/language/c++.mk

#
# C++11 compiler definitions for g++
#
DEPEND_ABI.g++ += g++>=4.8

CXXFLAGS+=$(strip \
  $(if $(filter g++ ccache-g++,${PKG_ALTERNATIVE.c++-compiler}),\
    $(if $(filter gcc-4% gcc-5% gcc-6.0%,${PKGVERSION.gcc}),-std=gnu++11)))

endif # _language_c++11_mk -------------------------------------------------
