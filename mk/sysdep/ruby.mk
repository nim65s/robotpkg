# robotpkg sysdep/ruby.mk
# Created:			Anthony Mallet on Thu Feb  6 2025
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
RUBY_DEPEND_MK:=	${RUBY_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		ruby
endif

ifeq (+,$(RUBY_DEPEND_MK)) # -----------------------------------------------

PREFER.ruby=		system

DEPEND_USE+=		ruby
DEPEND_ABI.ruby?=	ruby>=2

SYSTEM_SEARCH.ruby=\
  'bin/ruby{,[0-9]*}:1{s/^[^0-9.]*//;s/[^0-9.].*//p;}:% -v'

SYSTEM_PKG.Debian.ruby=	ruby
SYSTEM_PKG.Fedora.ruby=	ruby
SYSTEM_PKG.NetBSD.ruby=	lang/ruby

export RUBY=		$(word 1,${SYSTEM_FILES.ruby})

# Replace interpreter in source files
SUBST_STAGE.rb-interp=	pre-configure
SUBST_MESSAGE.rb-interp=Replacing ruby interpreter path
SUBST_SED.rb-interp=	-e '1s|^\\\#!.*ruby[0-9.]*|\\\#!${RUBY}|'
SUBST_SED.rb-interp+=	-e 's|@RUBY@|${RUBY}|'

endif # RUBY_DEPEND_MK -----------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
