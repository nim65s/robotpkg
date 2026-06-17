#
# Copyright (c) 2006, 2009-2013, 2026 LAAS/CNRS
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
#   3. All advertising materials mentioning   features or use of this
#      software must display the following acknowledgement:
#        This product includes software developed by the NetBSD
#        Foundation, Inc. and its contributors.
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
# From $NetBSD: bsd.plist.mk,v 1.1 2006/01/12 23:43:57 jlam Exp $
#
#                                       Anthony Mallet on Thu Dec  7 2006

# This is the path to the generated PLIST file.
PLIST=		${WRKDIR}/.PLIST

# PLIST_FILTER_CLASSES
#	A list of filters applied to PLIST. Builtin classes include the 'subst'
#	class, applying plist replacements or variables.
#
# PLIST_FILTER_STAGE.<class>
#	Run the filter after or before the listed classes. Can be pre-% or
#	post-% with % in PLIST_FILTER_CLASSES. Defaults to pre-subst.
# PRINT_PLIST_FILTER_STAGE.<class>
#	Same as PLIST_FILTER_STAGE.<class> but for the print-PLIST target.
#	Defaults to PLIST_FILTER_STAGE.<class> with pre- and post- swapped.
#
# PLIST_FILTER_AWK_PROG.<class>
# PLIST_FILTER_AWK.<class>
#	Define the filter program to run. PLIST_FILTER_AWK_PROG must refer to a
#	filename containing an awk prog. PLIST_FILTER_AWK must contain an awk
#	prog string.
#
PLIST_FILTER_CLASSES?=


# DYNAMIC_PLIST_DIRS
#	A list of directories relative to PREFIX whose contents after intall
#	target is added to PLIST.
DYNAMIC_PLIST_DIRS?=

# These Makefile fragments provide all PLIST-related variables and targets.
$(call require, ${ROBOTPKG_DIR}/mk/plist/plist.mk)
$(call require, ${ROBOTPKG_DIR}/mk/plist/print-plist.mk)
