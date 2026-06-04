TinyXML2 < 5 does not have GetLineNum()

--- src/cpp/xmlparser/XMLDynamicParser.cpp~	2026-04-21 16:02:17.000000000 +0200
+++ src/cpp/xmlparser/XMLDynamicParser.cpp	2026-06-06 14:10:14.469049606 +0200
@@ -1303,7 +1303,11 @@
         }
         catch (const std::exception&)
         {
+#if TIXML2_MAJOR_VERSION >= 5
             EPROSIMA_LOG_ERROR(XMLPARSER, "Error parsing member sequence length in line " << p_root->GetLineNum());
+#else
+            EPROSIMA_LOG_ERROR(XMLPARSER, "Error parsing member sequence length in " << p_root->Name());
+#endif
             return {};
         }
 
@@ -1415,8 +1419,13 @@
         }
         catch (const std::exception&)
         {
+#if TIXML2_MAJOR_VERSION >= 5
             EPROSIMA_LOG_ERROR(XMLPARSER,
                     "Error parsing map member sequence length in line " << p_root->GetLineNum());
+#else
+            EPROSIMA_LOG_ERROR(XMLPARSER,
+                    "Error parsing map member sequence length in " << p_root->Name());
+#endif
             return {};
         }
 
