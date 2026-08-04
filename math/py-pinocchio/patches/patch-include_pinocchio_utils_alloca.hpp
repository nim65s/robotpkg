Use in priority __builtin_alloca, as alloca(3) is unsafe
Also alloca.h header is glibc only, stdlib.h otherwise

--- include/pinocchio/utils/alloca.hpp~	2026-07-07 10:37:24.000000000 +0200
+++ include/pinocchio/utils/alloca.hpp	2026-08-04 13:05:42.709717132 +0200
@@ -6,8 +6,12 @@
 // IWYU pragma: begin_keep
 #ifdef _WIN32
   #include <malloc.h>
+#elif defined(__GNUC__) || defined(__clang__)
+# define alloca __builtin_alloca
+#elif defined(__GLIBC__)
+# include <alloca.h>
 #else
-  #include <alloca.h>
+# include <stdlib.h>
 #endif
 // IWYU pragma: end_keep
 
