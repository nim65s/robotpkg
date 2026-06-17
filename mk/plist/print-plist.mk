#
# Copyright (c) 2006-2009, 2011-2013, 2017, 2022, 2026 LAAS/CNRS
# All rights reserved.
#
# This project includes software developed by the NetBSD Foundation, Inc.
# and its contributors. It is derived from the 'pkgsrc' project
# (http://www.pkgsrc.org).
#
# Redistribution and use  in source  and binary  forms,  with or without
# modification, are permitted provided that the following conditions are
# met:
#
#   1. Redistributions of  source  code must retain the  above copyright
#      notice, this list of conditions and the following disclaimer.
#   2. Redistributions in binary form must reproduce the above copyright
#      notice,  this list of  conditions and the following disclaimer in
#      the  documentation  and/or  other   materials provided  with  the
#      distribution.
#
# THIS  SOFTWARE IS PROVIDED BY  THE  COPYRIGHT HOLDERS AND CONTRIBUTORS
# "AS IS" AND  ANY  EXPRESS OR IMPLIED  WARRANTIES,  INCLUDING,  BUT NOT
# LIMITED TO, THE IMPLIED WARRANTIES  OF MERCHANTABILITY AND FITNESS FOR
# A PARTICULAR  PURPOSE ARE DISCLAIMED. IN  NO EVENT SHALL THE COPYRIGHT
# HOLDERS OR      CONTRIBUTORS  BE LIABLE FOR   ANY    DIRECT, INDIRECT,
# INCIDENTAL,  SPECIAL,  EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
# BUT NOT LIMITED TO, PROCUREMENT OF  SUBSTITUTE GOODS OR SERVICES; LOSS
# OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
# ON ANY THEORY OF LIABILITY, WHETHER IN  CONTRACT, STRICT LIABILITY, OR
# TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE
# USE   OF THIS SOFTWARE, EVEN   IF ADVISED OF   THE POSSIBILITY OF SUCH
# DAMAGE.
#
# From $NetBSD: print-plist.mk,v 1.11 2006/11/15 10:40:34 joerg Exp $
#
#                                      Anthony Mallet on Wed Dec  6 2006
#

#
# Automatic PLIST generation
#  - files & symlinks first
#  - empty directories are handled properly
#  - substitute for platform or package specifics substrings
#
# Usage:
#  - make install
#  - make print-PLIST
#  - cat PLIST.guess | brain >PLIST
#

# The following variables affect the outpout of print-PLIST:
#
#    PRINT_PLIST_IGNORE_DIRS is a list of paths that should be ignored by
#	print-PLIST.
#
#    PRINT_PLIST_FILES_CMD is a sequence of commands, terminating in a
#	semicolon, that outputs any files modified since the package was
#	extracted.
#
#    PRINT_PLIST_FILTER is a sequence of commands, each starting with a pipe,
#	that receives the generated PLIST on stdin and is expected
#	to output the final PLIST (default: empty).
#
$(call require,${ROBOTPKG_DIR}/mk/pkg/pkg-vars.mk)
$(call require,${ROBOTPKG_DIR}/mk/build/build-vars.mk)

PRINT_PLIST_FILE?=		${PKGDIR}/PLIST.guess
PRINT_PLIST_IGNORE_DIRS+=	${DYNAMIC_PLIST_DIRS}
PRINT_PLIST_FILES_CMD?=		${TRUE};

PRINT_PLIST_FILTER?=


# Scan $PREFIX for any files/dirs that do not belong to any package.
#
_PRINT_PLIST_FILES_CMD=	\
  ${FIND} $(abspath ${PREFIX}) -xdev -ctime -1 ! -type d ! \(		\
    -path '${MAKECONF}' -o -path '${ROBOTPKG_DIR}/*' -o			\
    -path '${PKG_DBDIR}/*' -o -path '${PKG_REFCOUNT_DBDIR}/*'		\
  \) ! -exec ${PKG_INFO} -qFe {} 2>/dev/null \;				\
  ! -exec ${TEST} -d ${PKG_REFCOUNT_DBDIR}/{} \;			\
  -print;
_PRINT_PLIST_FILES_CMD+=						\
  { ${PKG_INFO} -qL ${PKGNAME} 2>/dev/null||:; } | while read f; do	\
    ${TEST} -f "$$f" && ${ECHO} "$$f";					\
  done;
_PRINT_PLIST_FILES_CMD+= ${PRINT_PLIST_FILES_CMD}

_PRINT_PLIST_DIRS_CMD=	\
  ${FIND} $(abspath ${PREFIX}) -xdev -ctime -1 -type d -empty ! \(	\
	-path '${MAKECONF}' -o -path '${ROBOTPKG_DIR}/*' -o		\
	-path '${PKG_DBDIR}/*'						\
  \) ! -exec ${PKG_INFO} -qFe {} 2>/dev/null \;				\
  -print;
_PRINT_PLIST_DIRS_CMD+=	\
  { ${PKG_INFO} -qf ${PKGNAME} 2>/dev/null||:; } | while read f; do	\
    case "$$f" in "@pkgdir "*) ${ECHO} "$${f\#@pkgdir }";; esac;	\
  done;


# --- subst ----------------------------------------------------------------
#
# PRINT_PLIST_NOSUBST avoids backward substitutions from PLIST_SUBST
#
PRINT_PLIST_NOSUBST?=

PLIST_AWK_ENV+= PRINT_PLIST_NOSUBST_VARS=$(call quote,${PRINT_PLIST_NOSUBST})


# --- print-PLIST filter engine --------------------------------------------
#

# default stage, reversed compared to plist unless otherwise specified
$(foreach _, $(sort ${PLIST_FILTER_CLASSES}),				\
  $(eval PRINT_PLIST_FILTER_STAGE.$_ ?=					\
    $(call substs, after- pre- post-, pre- post- after-,		\
      ${PLIST_FILTER_STAGE.$_}))					\
  $(eval _PRINT_PLIST_FILTER_DEPS.$_ :=))

# resolve filter stages
override define _print_plist_filter_stages
  # map pre-% STAGE to equivalent post-% in designated filter
  $(foreach _,								\
    $(patsubst pre-%,%,$(filter pre-%,${PRINT_PLIST_FILTER_STAGE.$1})),	\
      $(eval _PRINT_PLIST_FILTER_DEPS.$_ += $1))

  # filter {pre,post}-% STAGE: pre-% are removed, applied above, and
  # post-% are transformed into just the class name.
  _PRINT_PLIST_FILTER_DEPS.$1 +=					\
    $(patsubst post-%,%,$(filter-out pre-%,${PRINT_PLIST_FILTER_STAGE.$1}))
endef
$(foreach _, $(sort ${PLIST_FILTER_CLASSES}),				\
  $(eval $(call _print_plist_filter_stages,$_)))

# sort filters
_ppfilter_sorted:=
_ppfilter_cycle:=
override define _ppfilter_tsort
  $(if $(filter $1,${_ppfilter_sorted}),,				\
    $(if $(filter $1,${_ppfilter_cycle}),				\
      $(info Circular dependency in PLIST filters:)			\
      $(info $		${_ppfilter_cycle} $1)				\
      $(error aborting))						\
									\
    $(eval _ppfilter_cycle+=$1)						\
    $(foreach _,							\
      ${_PRINT_PLIST_FILTER_DEPS.$1},$(call _ppfilter_tsort,$_))	\
    $(eval _ppfilter_cycle:=$(filter-out $1,${_ppfilter_cycle}))	\
    $(eval _ppfilter_sorted+=$1)					\
    $1)
endef
PRINT_PLIST_FILTER_SORTED=\
  $(or ${_ppfilter_sorted},						\
    $(foreach _,${PLIST_FILTER_CLASSES},$(call _ppfilter_tsort,$_)))


# --- print-PLIST (PUBLIC) -------------------------------------------------
#
# print-PLIST is a public target to generate a initial PLIST for the package.
#
$(call require, ${ROBOTPKG_DIR}/mk/depends/depends-vars.mk)

_PRINT_PLIST_TARGETS+= $(call add-barrier, depends, print-PLIST)
_PRINT_PLIST_TARGETS+= print-PLIST-message
_PRINT_PLIST_TARGETS+= do-print-plist

.PHONY: print-PLIST
print-PLIST: ${_PRINT_PLIST_TARGETS}

.PHONY: do-print-plist
do-print-plist: $(foreach _,${PLIST_FILTER_CLASSES},${PLIST_FILTER_AWK_PROG.$_})
do-print-plist:
	${RUN}exec >${PRINT_PLIST_FILE};				\
	${ECHO} '@comment '`${_CDATE_CMD}`;				\
	{ ${_PRINT_PLIST_FILES_CMD} }					\
	 | ${SORT} -u							\
	 | ${SETENV} ${PLIST_AWK_ENV} ${AWK}				\
	    $(addprefix -f ,						\
	      ${_PLIST_PREFILTER_AWK_PROG}				\
	      $(foreach _,${PRINT_PLIST_FILTER_SORTED},			\
	        ${PLIST_FILTER_AWK_PROG.$_})				\
	      ${_PLIST_POSTFILTER_AWK_PROG})				\
	    collapse							\
         ${PRINT_PLIST_FILTER};						\
	{ ${_PRINT_PLIST_DIRS_CMD} }					\
	  | ${SORT} -r							\
	  | ${AWK} '							\
	      { sub("^$(abspath ${PREFIX})/+", ""); }			\
	      /^$$/ { next; }						\
  $(foreach _,${PRINT_PLIST_IGNORE_DIRS}, $$0 ~ "$_" { next })		\
	      { if ($$0 in entries) next; entries[$$0]; };		\
	      { print "@pkgdir " $$0; }'
	@${STEP_MSG} "Created ${PRINT_PLIST_FILE}"


.PHONY: print-PLIST-message
print-PLIST-message:
	@${PHASE_MSG} "Generating PLIST";				\
	${ECHO_MSG} '... this may take a long time'
