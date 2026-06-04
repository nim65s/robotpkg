Missing sys/wait.h for WEXITSTATUS

--- src/cpp/rtps/domain/RTPSDomain.cpp~	2026-04-21 16:02:17.000000000 +0200
+++ src/cpp/rtps/domain/RTPSDomain.cpp	2026-06-06 15:06:07.212021063 +0200
@@ -16,6 +16,9 @@
  * @file RTPSDomain.cpp
  */
 
+#ifndef _WIN32
+#include <sys/wait.h> /* WEXITSTATUS */
+#endif
 #include <fastdds/rtps/RTPSDomain.hpp>
 
 #include <chrono>
