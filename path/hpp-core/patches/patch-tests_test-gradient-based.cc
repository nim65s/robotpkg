For some reason, pinocchio/fwd.hpp must be included before boost
Related to https://github.com/stack-of-tasks/pinocchio/issues/1449

--- tests/test-gradient-based.cc~	2025-10-23 11:55:17.000000000 +0200
+++ tests/test-gradient-based.cc	2026-02-10 15:16:22.253409782 +0100
@@ -28,6 +28,7 @@
 // DAMAGE.
 
 #define BOOST_TEST_MODULE gradient_based
+#include <pinocchio/fwd.hpp>
 #include <coal/shape/geometric_shapes.h>
 
 #include <boost/test/included/unit_test.hpp>
@@ -43,7 +44,6 @@
 #include <hpp/pinocchio/joint.hh>
 #include <hpp/pinocchio/urdf/util.hh>
 #include <pinocchio/algorithm/frames.hpp>
-#include <pinocchio/fwd.hpp>
 #include <pinocchio/multibody/fcl.hpp>
 #include <pinocchio/multibody/geometry.hpp>
 
