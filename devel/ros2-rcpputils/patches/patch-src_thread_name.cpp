Fix pthread_setname_np(3).

--- src/thread_name.cpp~	2026-05-06 20:35:44.000000000 +0200
+++ src/thread_name.cpp	2026-06-08 23:50:27.271374578 +0200
@@ -75,8 +75,12 @@
   }
 #if defined(__APPLE__)
   int rc = pthread_setname_np(thread_name_ptr);
-#else  // posix
+#elif defined(__linux__)
   int rc = pthread_setname_np(pthread_self(), thread_name_ptr);
+#elif defined(__NetBSD__)
+  int rc = pthread_setname_np(pthread_self(), "%s", (void *)thread_name_ptr);
+#else
+  int rc = ENOTSUP;
 #endif  // defined(__APPLE__)
   if (rc != 0) {
     std::error_code error_code(rc, std::system_category());
