Zero() and Ones() in eigen3>=5 don't have the same types

--- include/crocoddyl/core/actions/lqr.hxx~	2026-04-17 00:08:36.000000000 +0200
+++ include/crocoddyl/core/actions/lqr.hxx	2026-09-09 16:42:40.976549793 +0200
@@ -68,7 +68,7 @@
       N_(MatrixXs::Zero(nx, nu)),
       G_(MatrixXs::Zero(0, nx + nu)),
       H_(MatrixXs::Zero(0, nx + nu)),
-      f_(drift_free ? VectorXs::Zero(nx) : VectorXs::Ones(nx)),
+      f_(VectorXs::Constant(nx, drift_free ? 0 : 1)),
       q_(VectorXs::Ones(nx)),
       r_(VectorXs::Ones(nu)),
       g_(VectorXs::Zero(0)),
