eigen3>=5 needs this and this does not hurt with earlier eigen3 versions

--- include/hpp/constraints/matrix-view.hh~	2026-07-24 17:42:50.000000000 +0200
+++ include/hpp/constraints/matrix-view.hh	2026-09-09 10:23:33.415489163 +0200
@@ -376,6 +376,7 @@
     : evaluator_base<
           MatrixBlockView<ArgType, _Rows, _Cols, _allRows, _allCols> > {
   typedef MatrixBlockView<ArgType, _Rows, _Cols, _allRows, _allCols> XprType;
+  typedef typename XprType::Scalar Scalar;

   enum {
     CoeffReadCost = evaluator<ArgType>::CoeffReadCost,
@@ -1038,6 +1038,13 @@
     return true;
   }

+  EIGEN_STRONG_INLINE MatrixBlockView &setZero() { return setConstant(Scalar(0)); }
+  EIGEN_STRONG_INLINE MatrixBlockView &setConstant(const Scalar &value) {
+    for (block_iterator block(*this); block.valid(); ++block)
+      _block(block).setConstant(value);
+    return *this;
+  }
+
   ArgType& m_arg;
   size_type m_nbRows;
   RowIndices_t m_rows;
