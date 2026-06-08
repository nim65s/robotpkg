Fix ctype(3) usage

--- rmw/src/validate_full_topic_name.c~	2026-05-06 20:28:21.000000000 +0200
+++ rmw/src/validate_full_topic_name.c	2026-06-08 22:50:19.986947065 +0200
@@ -103,7 +103,7 @@
         }
         return RMW_RET_OK;
       }
-      if (isdigit(topic_name[i + 1]) != 0) {
+      if (isdigit((unsigned char)topic_name[i + 1]) != 0) {
         // this is the case where a '/' if followed by a number, i.e. [0-9]
         *validation_result = RMW_TOPIC_INVALID_NAME_TOKEN_STARTS_WITH_NUMBER;
         if (invalid_index) {
