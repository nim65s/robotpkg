--- rclcpp/include/rclcpp/memory_strategy.hpp~	2026-05-22 11:42:12.000000000 +0200
+++ rclcpp/include/rclcpp/memory_strategy.hpp	2026-06-10 17:40:10.763439356 +0200
@@ -39,7 +39,7 @@
  * the rmw implementation after the executor waits for work, based on the number of entities that
  * come through.
  */
-class RCLCPP_PUBLIC [[deprecated("The executor does not used this anymore")]] MemoryStrategy
+  class RCLCPP_PUBLIC __attribute__((deprecated("The executor does not used this anymore"))) MemoryStrategy
 {
 public:
   RCLCPP_SMART_PTR_DEFINITIONS_NOT_COPYABLE(MemoryStrategy)
