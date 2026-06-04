SHOULD_DEBUG_LINUX on ... linux

--- src/cpp/rtps/reader/WriterProxy.cpp~	2026-06-06 14:04:38.232501426 +0200
+++ src/cpp/rtps/reader/WriterProxy.cpp	2026-06-06 14:45:59.677333398 +0200
@@ -33,7 +33,7 @@
 #include <rtps/reader/StatefulReader.hpp>
 #include <rtps/writer/BaseWriter.hpp>
 
-#if !defined(NDEBUG) && !defined(ANDROID) && defined(FASTDDS_SOURCE) && defined(__unix__)
+#if !defined(NDEBUG) && !defined(ANDROID) && defined(FASTDDS_SOURCE) && defined(__linux__)
 #define SHOULD_DEBUG_LINUX
 #endif // SHOULD_DEBUG_LINUX
 
