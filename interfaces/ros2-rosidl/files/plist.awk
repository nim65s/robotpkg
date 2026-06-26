# interfaces/ros2-rosidl/files/plist-generator.mk
#                                           Anthony Mallet on Thu Aug 17 2023
#

$1 == "share" && $NF == "idl" { rosidls[$0] }
$1 == "share" && $NF == "msg" { f = $0; sub(/[.]msg$/, "", f); msg[f] }
$1 == "share" && $NF == "srv" { f = $0; sub(/[.]srv$/, "", f); srv[f] }
$1 == "share" && $NF == "action" { f = $0; sub(/[.]action$/, "", f); act[f] }

NF > 3 && $NF == "cmake" && $(NF-1) ~ /^rosidl_cmake/ {
    f = $0; sub(/\/[^\/]+$/, "", f); cmake[f]
}

END {
    rosidl_adapters()
    rosidl_generators()
}

function rosidl_adapters(	f)
{
    # generated cmake files
    for(f in cmake) {
        generated[f, "rosidl_cmake_export_typesupport_libraries-extras.cmake"]
        generated[f, "rosidl_cmake_export_typesupport_targets-extras.cmake"]
        if (pkgversion("ros2-rosidl<5.1.3")) continue

        generated[f, "rosidl_cmake_aggregate_target-extras.cmake"]
    }

    if (pkgversion("ros2-rosidl<4.3")) {
        # split request/response messages are not considered as msg
        for(f in srv) {
            generated[f "_Request.msg"] = generated[f "_Response.msg"] = srv[f]
            delete msg[f "_Request"]; delete msg[f "_Response"]
        }
    }

    for(f in msg) { rosidls[f ".idl"]; generated[f ".idl"] }
    for(f in srv) { rosidls[f ".idl"]; generated[f ".idl"] }
    for(f in act) { rosidls[f ".idl"]; generated[f ".idl"] }
    if (f) here("ros2-rosidl")
}

function rosidl_generators(	i, n, path, base)
{
    if (!pkgversion("ros2-rosidl")) return

    for(i in rosidls) {
        n = split(i, path)
        rosidl_generator_type_description(path[2], path[n-2], path[n-1])

        base = decamel(path[n-1])
        rosidl_generator_c(path[2], path[n-2], base)
        rosidl_generator_cpp(path[2], path[n-2], base)
        rosidl_typesupport_introspection_c(path[2], path[n-2], base)
        rosidl_typesupport_introspection_cpp(path[2], path[n-2], base)
    }
}

function rosidl_generator_type_description(pkg, dir, base)
{
    generated["share", pkg, dir, base ".json"]
}

function rosidl_generator_c(pkg, dir, base)
{
    generated["include", pkg, pkg, "msg",
              "rosidl_generator_c__visibility_control.h"]

    generated["include", pkg, pkg, dir, "detail", base "__functions.h"]
    generated["include", pkg, pkg, dir, "detail", base "__functions.c"]
    generated["include", pkg, pkg, dir, "detail", base "__struct.h"]
    generated["include", pkg, pkg, dir, "detail", base "__type_support.h"]

    if (pkgversion("ros2-rosidl<4")) return

    generated["include", pkg, pkg, dir, "detail", base "__description.c"]
    generated["include", pkg, pkg, dir, "detail", base "__type_support.c"]
}

function rosidl_generator_cpp(pkg, dir, base)
{
    generated["include", pkg, pkg, dir, "detail", base "__builder.hpp"]
    generated["include", pkg, pkg, dir, "detail", base "__struct.hpp"]
    generated["include", pkg, pkg, dir, "detail", base "__traits.hpp"]

    if (pkgversion("ros2-rosidl<4.2")) return

    generated["include", pkg, pkg, dir, "detail", base "__type_support.hpp"]

    generated["include", pkg, pkg, "msg",
              "rosidl_generator_cpp__visibility_control.hpp"]
}

function rosidl_typesupport_introspection_c(pkg, dir, base)
{
    generated["include", pkg, pkg, "msg",
              "rosidl_typesupport_introspection_c__visibility_control.h"]

    generated["include", pkg, pkg, dir,
              "detail", base "__rosidl_typesupport_introspection_c.h"]

    # not sure sure why this belongs here, as this is redundant with
    # rosidl_generator_c>=4. Hopefully, the content is synced somehow?
    generated["include", pkg, pkg, dir, "detail", base "__type_support.c"]
}

function rosidl_typesupport_introspection_cpp(pkg, dir, base)
{
    generated["include", pkg, pkg, dir,
              "detail", base "__rosidl_typesupport_introspection_cpp.hpp"]
    generated["include", pkg, pkg, dir, "detail", base "__type_support.cpp"]
}
