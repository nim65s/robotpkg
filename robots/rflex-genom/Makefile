# robotpkg Makefile for:	robots/rflex-genom
# Created:			Arnaud Degroote on Mon, 19 May 2008
#

DISTNAME=		rflex-genom-0.3.1
CATEGORIES=		robots
MASTER_SITES=		${MASTER_SITE_OPENROBOTS}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_OPENROBOTS}irobot-robots/rflex-genom

MAINTAINER=		openrobots@laas.fr
COMMENT=		GenoM module for rFlex management.

GNU_CONFIGURE=		yes

PKG_OPTIONS_REQUIRED_GROUPS=	robot
PKG_OPTIONS_GROUP.robot=	atrv atrv-junior b21r

PKG_OPTION_DESCR.atrv=	Enable support for atrv platform
PKG_OPTION_SET.atrv:=	GENOM_ARGS+= -DATRV

PKG_OPTION_DESCR.atrv-junior=	Enable support for atrv-junior platform
PKG_OPTION_SET.atrv-junior:=	GENOM_ARGS+= -DATRV_JUNIOR

PKG_OPTION_DESCR.b21r=	Enable support for b21R platform
PKG_OPTION_SET.b21r:=	GENOM_ARGS+= -DB21R

PKG_OPTIONS_OPTIONAL_GROUPS=	gyro
PKG_OPTIONS_GROUP.gyro=			gyro-client gyroKVH1000 gyroKVH5000

PKG_OPTION_DESCR.gyro-client=	Enable gyro support using gyro GeNoM module
define PKG_OPTION_SET.gyro-client
  include ../../localization/gyro-genom/depend.mk
  GENOM_ARGS += -DGYRO=gyro-client
endef

PKG_OPTION_DESCR.gyroKVH1000=	Enable gyro support using directly gyroKVH1000
define PKG_OPTION_SET.gyroKVH1000
  include ../../hardware/gyroKVH1000/depend.mk
  GENOM_ARGS += -DGYRO=gyroKVH1000Task
endef

PKG_OPTION_DESCR.gyroKVH5000=	Enable gyro support using directly gyroKVH5000
define PKG_OPTION_SET.gyroKVH5000
  include ../../hardware/gyroKVH5000/depend.mk
  GENOM_ARGS += -DGYRO=gyroKVH5000
endef

PKG_SUGGESTED_OPTIONS=   atrv

GENOM_MODULE=		rflex
include ../../architecture/genom/depend.mk

include ../../interfaces/genBasic-genom/depend.mk
include ../../interfaces/genPos-genom/depend.mk
include ../../localization/pom-genom/depend.mk
include ../../robots/rflexclients/depend.mk
include ../../mk/language/c.mk
include ../../mk/robotpkg.mk
