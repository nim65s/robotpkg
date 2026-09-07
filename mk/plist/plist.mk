#
# Copyright (c) 2006-2013, 2026 LAAS/CNRS
# Copyright (c) 1994-2006 The NetBSD Foundation, Inc.
# All rights reserved.
#
# This project includes software developed by the NetBSD Foundation, Inc.
# and its contributors. It is derived from the 'pkgsrc' project
# (http://www.pkgsrc.org).
#
# Redistribution  and  use in source   and binary forms,  with or without
# modification, are permitted provided that  the following conditions are
# met:
#
#   1. Redistributions  of  source code must  retain  the above copyright
#      notice, this list of conditions and the following disclaimer.
#   2. Redistributions in binary form must  reproduce the above copyright
#      notice,  this list of  conditions and  the following disclaimer in
#      the  documentation   and/or  other  materials   provided with  the
#      distribution.
#   3. All  advertising materials  mentioning  features  or  use of  this
#      software must display  the following acknowledgement: This product
#      includes software  developed by  the  NetBSD Foundation, Inc.  and
#      its contributors.
#   4. Neither the  name  of The NetBSD Foundation  nor the names  of its
#      contributors  may be  used to endorse or promote  products derived
#      from this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE AUTHORS AND CONTRIBUTORS ``AS IS'' AND
# ANY  EXPRESS OR IMPLIED WARRANTIES, INCLUDING,  BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES   OF MERCHANTABILITY AND  FITNESS  FOR  A PARTICULAR
# PURPOSE ARE DISCLAIMED.  IN NO  EVENT SHALL THE AUTHOR OR  CONTRIBUTORS
# BE LIABLE FOR ANY DIRECT, INDIRECT,  INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING,  BUT  NOT LIMITED TO, PROCUREMENT  OF
# SUBSTITUTE  GOODS OR SERVICES;  LOSS   OF  USE,  DATA, OR PROFITS;   OR
# BUSINESS  INTERRUPTION) HOWEVER CAUSED AND  ON ANY THEORY OF LIABILITY,
# WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
# OTHERWISE) ARISING IN ANY WAY OUT OF THE  USE OF THIS SOFTWARE, EVEN IF
# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#
# From $NetBSD: plist.mk,v 1.18 2006/11/05 15:10:08 joerg Exp $
#
#                                       Anthony Mallet on Thu Dec  7 2006

#
# This Makefile fragment handles the creation of PLISTs for use by
# pkg_create(8).
#
#

# --- PLIST_SRC ------------------------------------------------------------
#
# Source file for the generated PLIST file.  If PLIST_SRC is not explicitly
# defined, then build one up from various PLIST.* files that are present in the
# package directory.  The order goes (if the files are present):
#
#	PLIST.${OPSYS}			(e.g., PLIST.NetBSD)
#	PLIST.${MACHINE_ARCH}		(e.g,, PLIST.macppc)
#	PLIST.${OPSYS}-${MACHINE_ARCH}	(e.g., PLIST.NetBSD-macppc)
#	PLIST
#
ifndef PLIST_SRC
  ifneq (${OS_KERNEL},${OPSYS})
    ifeq (yes,$(call exists,${PKGDIR}/PLIST.${OS_KERNEL}))
      PLIST_SRC+=	${PKGDIR}/PLIST.${OS_KERNEL}
    endif
  endif
  ifeq (yes,$(call exists,${PKGDIR}/PLIST.${OPSYS}))
    PLIST_SRC+=	${PKGDIR}/PLIST.${OPSYS}
  endif
  ifeq (yes,$(call exists,${PKGDIR}/PLIST.${MACHINE_ARCH}))
    PLIST_SRC+=	${PKGDIR}/PLIST.${MACHINE_ARCH}
  endif
  ifeq (yes,$(call exists,${PKGDIR}/PLIST.${OPSYS}-${MACHINE_ARCH}))
    PLIST_SRC+=	${PKGDIR}/PLIST.${OPSYS}-${MACHINE_ARCH}
  endif
  ifeq (yes,$(call exists,${PKGDIR}/PLIST))
    PLIST_SRC+=	${PKGDIR}/PLIST
  endif
endif # !PLIST_SRC


# --- GENERATE_PLIST -------------------------------------------------------
#
# Sequence of commands, terminating in a semicolon, that outputs contents for a
# PLIST to stdout and is appended to the contents of ${PLIST_SRC}.
#
ifeq (,$(strip $(PLIST_SRC)))
  GENERATE_PLIST?=  ${ECHO} "@comment "$(call quote,${PKGNAME})" has no files.";
else
  GENERATE_PLIST?=
endif

_GENERATE_PLIST=	${CAT} /dev/null ${PLIST_SRC}; ${GENERATE_PLIST}


# --- PLIST_AWK_ENV --------------------------------------------------------
#
# Holds the shell environment passed to the awk script that does
# post-processing of the PLIST.  See the individual *.awk scripts for
# information on each of the variable set in the environment.
#
PLIST_AWK_ENV+=	PREFIX=$(call quote,$(abspath ${PREFIX}))
PLIST_AWK_ENV+=	TEST=$(call quote,${TOOLS_TEST})


# --- subst ----------------------------------------------------------------
#
# PLIST_SUBST contains package-settable "${variable}" to "value"
# substitutions for PLISTs
#
PLIST_FILTER_CLASSES+= subst
PLIST_FILTER_STAGE.subst=

PLIST_FILTER_AWK_PROG.subst=\
  ${ROBOTPKG_DIR}/mk/plist/plist-subst.awk

PLIST_SUBST+=\
  PLIST_OPSYS=$(call quote,${OPSYS})					\
  PLIST_OS_VERSION=$(call quote,${OS_VERSION})				\
  PLIST_OS_KERNEL=$(call quote,${OS_KERNEL})				\
  PLIST_LOWER_OS_KERNEL=$(call quote,${LOWER_OS_KERNEL})		\
  PLIST_OS_KERNEL_VERSION=$(call quote,${OS_KERNEL_VERSION})		\
  PLIST_NODENAME=$(call quote,${NODENAME})				\
  PLIST_MACHINE_ARCH=$(call quote,${MACHINE_ARCH})			\
  PLIST_MACHINE_GNU_ARCH=$(call quote,${MACHINE_GNU_ARCH})		\
  PLIST_MACHINE_GNU_PLATFORM=$(call quote,${MACHINE_GNU_PLATFORM})	\
  PLIST_LOWER_VENDOR=$(call quote,${LOWER_VENDOR})			\
  PLIST_LOWER_OPSYS=$(call quote,${LOWER_OPSYS})			\
  PLIST_LOWER_OS_VERSION=$(call quote,${LOWER_OS_VERSION})		\
  PLIST_PKGNAME=$(call quote,${PKGNAME_NOREV})				\
  PLIST_PKGVERSION=$(call quote,${PKGVERSION_NOREV})			\
  PLIST_DISTNAME=$(call quote,${DISTNAME})

PLIST_SUBST+=\
  PLIST_PKGMANDIR=$(call quote,${PKGMANDIR}/)
  PLIST_PKGINFODIR=$(call quote,${PKGINFODIR}/)

PLIST_SUBST+=$(foreach _,${PLIST_VARS},					\
  PLIST.$_=$(call quote,${PLIST.$_})					\
  PLIST.no$_=$(call quote,${PLIST.no_}))

PLIST_SUBST_VARS=$(strip $(foreach _,${PLIST_SUBST},			\
  $(if $(findstring =,$_),$(firstword $(subst =, ,$_)))))

PLIST_AWK_ENV+= ${PLIST_SUBST}
PLIST_AWK_ENV+= PLIST_SUBST_VARS=$(call quote,${PLIST_SUBST_VARS})


# --- libtool --------------------------------------------------------------
#
ifneq (,$(call isyes,${LIBTOOLIZE_PLIST}))
  PLIST_FILTER_CLASSES+= libtool
  PLIST_FILTER_STAGE.libtool= post-subst
  PLIST_FILTER_AWK_PROG.libtool=\
    ${ROBOTPKG_DIR}/mk/plist/plist-libtool.awk

  PLIST_AWK_ENV+= ECHO=$(call quote,${TOOLS_ECHO})
  PLIST_AWK_ENV+= GREP=$(call quote,${TOOLS_GREP})
  PLIST_AWK_ENV+=\
    LIBTOOL_EXPAND=$(call quote,${SH} ${ROBOTPKG_DIR}/mk/plist/libtool-expand)
endif


# --- DYNAMIC_PLIST_DIRS ---------------------------------------------------
#
ifneq (,$(strip ${DYNAMIC_PLIST_DIRS}))
  GENERATE_PLIST+=							\
    ${FIND} $(addprefix ${PREFIX}/,					\
      $(patsubst $(abspath ${PREFIX})/%,%,${DYNAMIC_PLIST_DIRS}))	\
      \( -type f -o -type l \)						\
      ! -exec ${PKG_INFO} -qFe {} 2>/dev/null \; -print;

  PLIST_FILTER_CLASSES+= dynamic-dirs
  PLIST_FILTER_STAGE.dynamic-dirs= post-subst
  PLIST_FILTER_AWK_PROG.dynamic-dirs=\
    ${ROBOTPKG_DIR}/mk/plist/plist-dynamic-dirs.awk

  PLIST_AWK_ENV+=\
    DYNAMIC_PLIST_DIRS=$(call quote,$(patsubst				\
      $(abspath ${PREFIX})/%,%,${DYNAMIC_PLIST_DIRS}))
endif


# --- ----------------------------------------------------------------------

_SHLIB_AWKFILE.ELF=	# nop
_SHLIB_AWKFILE.dylib=	${ROBOTPKG_DIR}/mk/plist/shlib-dylib.awk
_SHLIB_AWKFILE.aout=	${ROBOTPKG_DIR}/mk/plist/shlib-aout.awk
_SHLIB_AWKFILE.none=	${ROBOTPKG_DIR}/mk/plist/shlib-none.awk
ifdef _OPSYS_SHLIB_TYPE
  _PLIST_SHLIB_AWK=	${_SHLIB_AWKFILE.$(strip ${_OPSYS_SHLIB_TYPE})}
endif


# --- PLIST filter engine --------------------------------------------------
#
_PLIST_PREFILTER_AWK_PROG=\
  ${ROBOTPKG_DIR}/mk/internal/libdewey.awk				\
  ${ROBOTPKG_DIR}/mk/plist/plist-functions.awk				\
  ${ROBOTPKG_DIR}/mk/plist/plist-cleanpath.awk

_PLIST_POSTFILTER_AWK_PROG=\
  ${ROBOTPKG_DIR}/mk/plist/plist-cleanpath.awk				\
  ${ROBOTPKG_DIR}/mk/plist/plist-default.awk

# export package dependency versions for use in filters
PLIST_AWK_ENV+=\
  PKGVERSIONS=$(call quote,$(foreach _,${DEPEND_USE},${PKGVERSION.$_}))

# default stage
$(foreach _, $(sort ${PLIST_FILTER_CLASSES}),				\
  $(eval PLIST_FILTER_STAGE.$_ ?=	pre-subst)			\
  $(eval _PLIST_FILTER_DEPS.$_ :=))

# filter scripts
_PLIST_FILTER_AWK= ${WRKDIR}/.plist_filter
override define _plist_filter_scripts
  # convert raw awk script source to a file
  ifdef PLIST_FILTER_AWK.$1
    PLIST_FILTER_AWK_PROG.$1 +=${_PLIST_FILTER_AWK}.$1
    ${_PLIST_FILTER_AWK}.$1: export plist_filter=$${PLIST_FILTER_AWK.$1}
  endif
endef
$(foreach _, $(sort ${PLIST_FILTER_CLASSES}),				\
  $(eval $(call _plist_filter_scripts,$_)))

# resolve filter stages
override define _plist_filter_stages
  # map pre-% STAGE to equivalent post-% in designated filter
  $(foreach _,								\
    $(patsubst pre-%,%,$(filter pre-%,${PLIST_FILTER_STAGE.$1})),	\
      $(eval _PLIST_FILTER_DEPS.$_ += $1))

  # filter {pre,post}-% STAGE: pre-% are removed, applied above, and
  # post-% are transformed into just the class name.
  _PLIST_FILTER_DEPS.$1 +=						\
    $(patsubst post-%,%,$(filter-out pre-%,${PLIST_FILTER_STAGE.$1}))
endef
$(foreach _, $(sort ${PLIST_FILTER_CLASSES}),				\
  $(eval $(call _plist_filter_stages,$_)))

# sort filters
_pfilter_sorted:=
_pfilter_cycle:=
override define _pfilter_tsort
  $(if $(filter $1,${_pfilter_sorted}),,				\
    $(if $(filter $1,${_pfilter_cycle}),				\
      $(info Circular dependency in PLIST filters:)			\
      $(info $		${_pfilter_cycle} $1)				\
      $(error aborting))						\
									\
    $(eval _pfilter_cycle+=$1)						\
    $(foreach _,${_PLIST_FILTER_DEPS.$1},$(call _pfilter_tsort,$_))	\
    $(eval _pfilter_cycle:=$(filter-out $1,${_pfilter_cycle}))		\
    $(eval _pfilter_sorted+=$1)						\
    $1)
endef
PLIST_FILTER_SORTED=\
  $(or ${_pfilter_sorted},						\
    $(foreach _,${PLIST_FILTER_CLASSES},$(call _pfilter_tsort,$_)))


# --- plist ----------------------------------------------------------------
#
_PLIST_TARGETS+=	${PLIST}
_PLIST_TARGETS+=	post-plist

.PHONY: plist
plist: ${_PLIST_TARGETS}

${PLIST}: $(foreach _,${PLIST_FILTER_CLASSES},${PLIST_FILTER_AWK_PROG.$_})
${PLIST}: ${PLIST_SRC}
	${RUN}${MKDIR} $(dir $@);					\
	{ ${_GENERATE_PLIST} }						\
	| ${SETENV} ${PLIST_AWK_ENV} ${AWK}				\
	    $(addprefix -f ,						\
	      ${_PLIST_PREFILTER_AWK_PROG}				\
	      $(foreach _,${PLIST_FILTER_SORTED},			\
	        ${PLIST_FILTER_AWK_PROG.$_})				\
	      ${_PLIST_POSTFILTER_AWK_PROG})				\
	    expand							\
  $(if $(strip ${_PLIST_SHLIB_AWK}),					\
	| ${SETENV} ${PLIST_AWK_ENV} ${AWK} -f ${_PLIST_SHLIB_AWK})	\
	>$@

${_PLIST_FILTER_AWK}.%: .FORCE
	${RUN}${MKDIR} $(dir $@);					\
	${ECHO} "$$plist_filter" >$@.tmp;				\
	if ${CMP} -s $@.tmp $@; then					\
	  ${RM} $@.tmp;							\
	else								\
	  ${MV} -f $@.tmp $@;						\
	fi

.PHONY: post-plist
post-plist:

${PLIST_SRC}:;
