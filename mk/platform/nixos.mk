#
# Variable definitions for NixOS
#

# Standard commands
$(call setdefault, SH,		/run/current-system/sw/bin/sh)
$(call setdefault, CAT,		/run/current-system/sw/bin/cat)
$(call setdefault, SETENV,	/run/current-system/sw/bin/env)
$(call setdefault, EXPR,	/run/current-system/sw/bin/expr)
$(call setdefault, CMP,		/run/current-system/sw/bin/cmp)
$(call setdefault, LS,		/run/current-system/sw/bin/ls)
$(call setdefault, WC,		/run/current-system/sw/bin/wc)
$(call setdefault, TOUCH,	/run/current-system/sw/bin/touch)
$(call setdefault, CHOWN,	/run/current-system/sw/bin/chown)
$(call setdefault, CHMOD,	/run/current-system/sw/bin/chmod)
$(call setdefault, CP,		/run/current-system/sw/bin/cp)
$(call setdefault, LN,		/run/current-system/sw/bin/ln)
$(call setdefault, MV,		/run/current-system/sw/bin/mv)
$(call setdefault, RM,		/run/current-system/sw/bin/rm)
$(call setdefault, RMDIR,	/run/current-system/sw/bin/rmdir)
$(call setdefault, MKDIR,	/run/current-system/sw/bin/mkdir -p)
$(call setdefault, DATE,	/run/current-system/sw/bin/date)
$(call setdefault, ID,		/run/current-system/sw/bin/id)
$(call setdefault, GREP,	/run/current-system/sw/bin/grep)
$(call setdefault, EGREP,	/run/current-system/sw/bin/egrep)
$(call setdefault, FIND,	/run/current-system/sw/bin/find)
$(call setdefault, SED,		/run/current-system/sw/bin/sed)
$(call setdefault, SORT,	/run/current-system/sw/bin/sort)
$(call setdefault, TSORT,	/run/current-system/sw/bin/tsort)
$(call setdefault, AWK,		/run/current-system/sw/bin/awk)
$(call setdefault, XARGS,	/run/current-system/sw/bin/xargs)
$(call setdefault, TPUT,	/run/current-system/sw/bin/tput)
$(call setdefault, PAGER,	/run/current-system/sw/bin/less)
$(call setdefault, PRINTF,	/run/current-system/sw/bin/printf)

PKGLOCALEDIR?=	share


include ${ROBOTPKG_DIR}/mk/platform/generic.mk
