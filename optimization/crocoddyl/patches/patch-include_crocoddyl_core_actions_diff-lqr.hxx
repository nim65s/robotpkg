Zero() and Ones() in eigen3>=5 don't have the same types

--- include/crocoddyl/core/actions/diff-lqr.hxx~	2026-04-17 00:08:36.000000000 +0200
+++ include/crocoddyl/core/actions/diff-lqr.hxx	2026-09-09 16:34:23.529740430 +0200
@@ -68,7 +68,7 @@
       N_(MatrixXs::Zero(2 * nq, nu)),
       G_(MatrixXs::Zero(0, 2 * nq + nu)),
       H_(MatrixXs::Zero(0, 2 * nq + nu)),
-      f_(drift_free ? VectorXs::Zero(nq) : VectorXs::Ones(nq)),
+      f_(VectorXs::Constant(nq, drift_free ? 0 : 1)),
       q_(VectorXs::Ones(2 * nq)),
       r_(VectorXs::Ones(nu)),
       g_(VectorXs::Zero(0)),
