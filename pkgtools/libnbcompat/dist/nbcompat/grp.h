/*	$NetBSD: grp.h,v 1.3 2008/09/08 20:20:23 joerg Exp $	*/

/*-
 * Copyright (c) 2004 The NetBSD Foundation, Inc.
 * All rights reserved.
 *
 * This code is derived from software contributed to The NetBSD Foundation
 * by Johnny C. Lam.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY THE NETBSD FOUNDATION, INC. AND CONTRIBUTORS
 * ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
 * TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 * PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE FOUNDATION OR CONTRIBUTORS
 * BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 */

#ifndef _NBCOMPAT_GRP_H_
#define _NBCOMPAT_GRP_H_

#if HAVE_GRP_H
# include <grp.h>
#endif

/*
 * Declare functions that may be missing in <grp.h>.
 */

#if !HAVE_SETGROUPENT
int setgroupent(int);
#endif

#if !HAVE_GROUP_FROM_GID
const char *group_from_gid(gid_t, int);
#endif

#if !HAVE_GID_FROM_GROUP
int gid_from_group(const char *, gid_t *);
#endif

#if !HAVE_DECL_ENDGRENT
void endgrent(void);
#endif

#if !HAVE_PWCACHE_GROUPDB
int pwcache_groupdb(int (*)(int), void (*)(void),
                    struct group *(*)(const char *), struct group * (*)(gid_t));
#endif

#endif	/* !_NBCOMPAT_GRP_H_ */
