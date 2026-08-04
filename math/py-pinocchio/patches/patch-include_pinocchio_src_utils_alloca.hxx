Use default alloca if EIGEN_ALLOCA is undefined.

--- include/pinocchio/src/utils/alloca.hxx~	2026-07-07 10:37:24.000000000 +0200
+++ include/pinocchio/src/utils/alloca.hxx	2026-08-04 14:04:09.874950434 +0200
@@ -11,7 +11,12 @@
   #include "pinocchio/utils/alloca.hpp"
 #endif // PINOCCHIO_LSP
 
-#define _PINOCCHIO_ALLOCA EIGEN_ALLOCA
+#ifdef EIGEN_ALLOCA
+# define _PINOCCHIO_ALLOCA EIGEN_ALLOCA
+#else
+# define _PINOCCHIO_ALLOCA alloca
+#endif
+
 #define _PINOCCHIO_ALIGNED_PTR(ptr, align)                                                         \
   reinterpret_cast<void *>(((intptr_t)ptr + (align - 1)) & ~(align - 1))
 #define _PINOCCHIO_EIGEN_MAP_ALLOCA(S, rows, cols)                                                 \
