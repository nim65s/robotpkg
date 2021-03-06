# robotpkg depend.mk for:	middleware/yarp
# Created:			Anthony Mallet on Thu, 22 Jan 2009
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
YARP_DEPEND_MK:=	${YARP_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		yarp
endif

ifeq (+,$(YARP_DEPEND_MK)) # -----------------------------------------------

PREFER.yarp?=		robotpkg

DEPEND_USE+=		yarp
DEPEND_ABI.yarp?=	yarp>=2.3.1
DEPEND_DIR.yarp?=	../../middleware/yarp

SYSTEM_SEARCH.yarp=\
  'bin/yarp:s/[^.0-9]//gp:% version'	\
  'include/yarp/dev/all.h'		\
  'lib/libYARP_{OS,os}.{a,so}'

include ../../middleware/ace/depend.mk

endif # YARP_DEPEND_MK ----------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
