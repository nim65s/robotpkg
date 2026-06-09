* Use strtod_l(3) where available
* Fallback to regular strtod if neither uselocale(3) or strtod_l(3) available
* Fix ctype(3) usage

--- rcl_yaml_param_parser/src/parse.c~	2026-05-22 11:40:49.000000000 +0200
+++ rcl_yaml_param_parser/src/parse.c	2026-06-09 19:24:17.345753907 +0200
@@ -843,9 +843,16 @@
     return 0.;
   }
 
+#if defined(HAVE_STRTOD_L)
+  double result = strtod_l(nptr, endptr, c_locale);
+#elif defined(HAVE_USELOCALE)
   locale_t old_locale = uselocale(c_locale);
   double result = strtod(nptr, endptr);
   uselocale(old_locale);
+#else
+# warning "No locale independent strtod"
+  double result = strtod(nptr, endptr);
+#endif
   return result;
 #endif
 }
@@ -875,7 +882,7 @@
     (0 == strcmp(value, "-.Inf")) ||
     (0 == strcmp(value, "-.INF")))
   {
-    for (iter_ptr = value; !isalpha(*iter_ptr); ) {
+    for (iter_ptr = value; !isalpha((unsigned char)*iter_ptr); ) {
       iter_ptr += 1;
     }
     dval = strtod_locale_independent(iter_ptr, &endptr);
