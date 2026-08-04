Fix relative rpath not supported on some platforms

--- tests/tests.pro~	2025-02-11 14:51:05.000000000 +0100
+++ tests/tests.pro	2026-08-04 13:13:34.467160186 +0200
@@ -1,13 +1,13 @@
 # --------- PythonQtTest profile -------------------
 # Last changed by $Author: florian $
-# $Id: PythonQt.pro 35381 2006-03-16 13:05:52Z florian $
+# $Id: tests.pro 2026/08/04 13:13:34 tho $
 # $Source$
 # --------------------------------------------------
 TARGET   = PythonQtTest
 TEMPLATE = app
 
 DESTDIR    = ../lib
-QMAKE_RPATHDIR += $$DESTDIR
+QMAKE_RPATHDIR += $$PWD/$$DESTDIR
 
 QT += testlib
 CONFIG += testcase cmdline exceptions testcase_no_bundle no_testcase_installs
