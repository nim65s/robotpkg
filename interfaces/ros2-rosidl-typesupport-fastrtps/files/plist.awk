# interfaces/ros2-rosidl/files/plist-generator.mk
#                                           Anthony Mallet on Thu Aug 17 2023
#

# Needs interfaces/ros2-rosidl/files/plist.awk for rosidls array
#
END { rosidl_typesupport_fastrtps() }

function rosidl_typesupport_fastrtps(	i, n, path, base) {
    if (!pkgversion("ros2-rosidl-typesupport-fastrtps")) return

    for(i in rosidls) {
        n = split(i, path)

        base = decamel(path[n-1])
        rosidl_typesupport_fastrtps_c(path[2], path[n-2], base)
        rosidl_typesupport_fastrtps_cpp(path[2], path[n-2], base)
    }
    if (i) here("ros2-rosidl-typesupport-fastrtps")
}

function rosidl_typesupport_fastrtps_c(pkg, dir, base)
{
    generated["include", pkg, pkg, "msg",
              "rosidl_typesupport_fastrtps_c__visibility_control.h"]

    generated["include", pkg, pkg, dir,
             "detail", base "__rosidl_typesupport_fastrtps_c.h"]
}

function rosidl_typesupport_fastrtps_cpp(pkg, dir, base)
{
    generated["include", pkg, pkg, "msg",
              "rosidl_typesupport_fastrtps_cpp__visibility_control.h"]

    generated["include", pkg, pkg, dir,
              "detail", base "__rosidl_typesupport_fastrtps_cpp.hpp"]
    generated["@pkgdir include", pkg, pkg, dir, "detail", "dds_fastrtps"]
}
