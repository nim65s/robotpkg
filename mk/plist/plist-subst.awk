# Copyright (c) 2006-2013, 2026 LAAS/CNRS
# Copyright (c) 2006 The NetBSD Foundation, Inc.
# All rights reserved.
#
# This code is derived from software contributed to The NetBSD Foundation
# by Johnny C. Lam.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
# 1. Redistributions of source code must retain the above copyright
#    notice, this list of conditions and the following disclaimer.
# 2. Redistributions in binary form must reproduce the above copyright
#    notice, this list of conditions and the following disclaimer in the
#    documentation and/or other materials provided with the distribution.
# 3. All advertising materials mentioning features or use of this software
#    must display the following acknowledgement:
#        This product includes software developed by the NetBSD
#        Foundation, Inc. and its contributors.
# 4. Neither the name of The NetBSD Foundation nor the names of its
#    contributors may be used to endorse or promote products derived
#    from this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE NETBSD FOUNDATION, INC. AND CONTRIBUTORS
# ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
# TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
# PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE FOUNDATION OR CONTRIBUTORS
# BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
# INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
# CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
# ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
# POSSIBILITY OF SUCH DAMAGE.
#
# From $NetBSD: plist-subst.awk,v 1.3 2006/05/02 14:32:35 jlam Exp $
#

# The variables which will be substituted are passed in the environment
# variable PLIST_SUBST_VARS and the named variables should be found in the
# shell environment. PRINT_PLIST_NOSUBST_VARS can avoid backward substs in
# collapse mode
#
function plist_subst_init(	a, i, j, l, vars, var, val, del)
{
    split(ENVIRON["PLIST_SUBST_VARS"], vars, " ")
    if (plist_collapse) {
        split(ENVIRON["PRINT_PLIST_NOSUBST_VARS"], a, " ")
        for (i in a) del[a[i]]
    }

    for (i in vars) {
        var = vars[i]
        if (var in del) continue

        val = ENVIRON[var]
        sub("^PLIST_", "", var)

        if (plist_expand) {
            # build an array of <regexp, value> pairs
            subst["[$][{]" var "[}]"] = val
        }

        if (plist_collapse && val) {
            # build array of replacements sorted by longest first
            l = length(val)
            for (j = substlen[0]; j > 0; j--) {
                if (substlen[j] > l) break;
                subst[j+1] = subst[j]
                substpat[j+1] = substpat[j]
                substlen[j+1] = substlen[j]
            }
            subst[j+1] = "${" var "}"
            substpat[j+1] = val
            substlen[j+1] = l
            substlen[0]++
        }
    }
}

BEGIN { plist_subst_init() }

# For each entry, replace all ${...} variables with their respective
# values taken from the environment.
#
plist_expand {
    for (regexp in subst)
        gsub(regexp, subst[regexp])
}

plist_collapse && !($0 in generated) {
    s = $0
    for (j = 1; j <= substlen[0]; j++) {
        for (m = 1;
             i = index(substr(s, m), substpat[j]);
             m = i + length(subst[j])) {
            i += m-1;
            s = substr(s, 1, i-1) subst[j] substr(s, i + substlen[j])
        }
    }
    subst_orig[s] = $0
    $0 = s
}

END {
    # mark substitued entries as generated if needed
    for(f in subst_orig)
        if (subst_orig[f] in generated)
            generated[f] = generated[subst_orig[f]]
}
