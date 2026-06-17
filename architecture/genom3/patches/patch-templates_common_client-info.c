Fix strict standard compliance for gcc<7

diff --git templates/common/client-info.c templates/common/client-info.c
index e4d341e..08e2e95 100644
--- templates/common/client-info.c
+++ templates/common/client-info.c
@@ -167,20 +167,17 @@ const struct genom_client_info genom_<"$comp">_client_info = {
 
 <'  foreach s [$c services] {'>
 const struct genom_service_info *genom_<"$comp">_client_<"[$s name]">_info =
-  &genom_<"$comp">_client_info
-  .services[genom_<"$comp">_svc_<"[$s name]">_index];
+  &genom_<"$comp">_service_info[genom_<"$comp">_svc_<"[$s name]">_index];
 <'  }'>
 
 <'  foreach p [$c ports out] {'>
 const struct genom_port_info *genom_<"$comp">_client_<"[$p name]">_info =
-  &genom_<"$comp">_client_info
-  .ports[genom_<"$comp">_pout_<"[$p name]">_index];
+  &genom_<"$comp">_port_info[genom_<"$comp">_pout_<"[$p name]">_index];
 <'  }'>
 
 <'  foreach p [$c ports in] {'>
 const struct genom_pub_info *genom_<"$comp">_client_<"[$p name]">_info =
-  &genom_<"$comp">_client_info
-  .pubs[genom_<"$comp">_pin_<"[$p name]">_index];
+  &genom_<"$comp">_pub_info[genom_<"$comp">_pin_<"[$p name]">_index];
 <'  }'>
 
 <'}'>
