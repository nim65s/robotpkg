/*	$NetBSD: pwd.h,v 1.4 2013/02/10 12:38:52 obache Exp $	*/

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

#ifndef _NBCOMPAT_PWD_H_
#define _NBCOMPAT_PWD_H_

#if HAVE_PWD_H
# include <pwd.h>
#endif

/*
 * Declare functions that may be missing in <pwd.h>.
 */

#if !HAVE_SETPASSENT || !HAVE_DECL_SETPASSENT
int setpassent(int);
#endif

#if !HAVE_USER_FROM_UID
const char *user_from_uid(uid_t, int);
#endif

#if !HAVE_UID_FROM_USER
int uid_from_user(const char *, uid_t *);
#endif

#if !HAVE_DECL_ENDPWENT
void endpwent(void);
#endif

#if !HAVE_PWCACHE_USERDB
int pwcache_userdb(int (*)(int), void (*)(void),
                   struct passwd * (*)(const char *),
                   struct passwd * (*)(uid_t));
#endif

#endif	/* !_NBCOMPAT_PWD_H_ */
