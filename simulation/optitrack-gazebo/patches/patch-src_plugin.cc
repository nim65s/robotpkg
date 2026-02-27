For close(2)

diff --git src/plugin.cc src/plugin.cc
index 9f8c908..8235771 100644
--- src/plugin.cc
+++ src/plugin.cc
@@ -30,6 +30,7 @@
 #include <err.h>
 #include <pthread.h>
 #include <stddef.h>
+#include <unistd.h>
 
 #include <chrono>
 
