Fix ctype(3) usage

--- rmw/src/validate_node_name.c~	2026-05-06 20:28:21.000000000 +0200
+++ rmw/src/validate_node_name.c	2026-06-08 22:51:30.500952541 +0200
@@ -69,7 +69,7 @@
       return RMW_RET_OK;
     }
   }
-  if (isdigit(node_name[0]) != 0) {
+  if (isdigit((unsigned char)node_name[0]) != 0) {
     // this is the case where the name starts with a number, i.e. [0-9]
     *validation_result = RMW_NODE_NAME_INVALID_STARTS_WITH_NUMBER;
     if (invalid_index) {
