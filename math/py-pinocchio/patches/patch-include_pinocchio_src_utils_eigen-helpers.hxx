Use Eigen::MatrixBase<> for template functions accepting matrix input, as
documented by eigen. Not sure why compare_maps should be restricted to
Eigen::Map<> (apart for the name of the function).
Also not sure why this function is needed at all.

Using Eigen::MapBase fails at least with g++-11/eigen-3.4.0:

include/pinocchio/src/container/matrix-stack.hxx:357:40: error: no matching function for call to 'compare_maps(const Eigen::Map<Eigen::Matrix<double, 1, -1>, 16, Eigen::Stride<0, 0> >&, const Eigen::Map<Eigen::Matrix<double, 1, -1>, 16, Eigen::Stride<0, 0> >&)'

include/pinocchio/src/utils/eigen-helpers.hxx:143:5: note: candidate: 'template<class D1, int Level1, class D2, int Level2> bool pinocchio::internal::compare_maps(const Eigen::MapBase<D1, Level1>&, const Eigen::MapBase<D2, Level2>&)'

include/pinocchio/src/utils/eigen-helpers.hxx:143:5: note:   template argument deduction/substitution failed:
include/pinocchio/src/container/matrix-stack.hxx:357:40: note:   'const Eigen::MapBase<D1, Level1>' is an ambiguous base class of 'const Eigen::Map<Eigen::Matrix<double, 1, -1>, 16, Eigen::Stride<0, 0> >'

--- include/pinocchio/src/utils/eigen-helpers.hxx~	2026-07-07 10:37:24.000000000 +0200
+++ include/pinocchio/src/utils/eigen-helpers.hxx	2026-08-06 01:23:41.881684186 +0200
@@ -138,9 +138,9 @@
 
     } // namespace helper
 
-    template<typename D1, int Level1, typename D2, int Level2>
+    template<typename D1, typename D2>
     bool
-    compare_maps(const Eigen::MapBase<D1, Level1> & map1, const Eigen::MapBase<D2, Level2> & map2)
+    compare_maps(const Eigen::MatrixBase<D1> & map1, const Eigen::MatrixBase<D2> & map2)
     {
       if ((map1.rows() != map2.rows()) || (map1.cols() != map2.cols()))
         return false;
