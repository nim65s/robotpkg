For some reason, pinocchio/fwd.hpp must be included before boost
Related to https://github.com/stack-of-tasks/pinocchio/issues/1449

--- tests/containers.cc~	2025-10-23 11:55:17.000000000 +0200
+++ tests/containers.cc	2026-02-10 15:19:41.237842444 +0100
@@ -1,4 +1,4 @@
-// Copyright (c) 2016, Joseph Mirabel
+// Copyright (c) 2016, 2026, Joseph Mirabel
 // Authors: Joseph Mirabel (joseph.mirabel@laas.fr)
 //
 
@@ -27,6 +27,7 @@
 // DAMAGE.
 
 #define BOOST_TEST_MODULE containers
+#include <pinocchio/fwd.hpp>
 #include <boost/test/included/unit_test.hpp>
 #include <hpp/core/container.hh>
 
