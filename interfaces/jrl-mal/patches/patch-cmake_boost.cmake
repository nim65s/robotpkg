boost::system is header only since 1.69 and removed in 1.90

--- cmake/boost.cmake~	2016-06-16 15:28:19.000000000 +0200
+++ cmake/boost.cmake	2026-09-09 14:28:56.445304645 +0200
@@ -38,7 +38,7 @@
 
   IF(NOT DEFINED BOOST_COMPONENTS)
     SET(BOOST_COMPONENTS
-      filesystem system thread program_options unit_test_framework)
+      filesystem thread program_options unit_test_framework)
   ENDIF(NOT DEFINED BOOST_COMPONENTS)
 
   FIND_PACKAGE(Boost ${BOOST_REQUIRED} COMPONENTS ${BOOST_COMPONENTS} REQUIRED)
