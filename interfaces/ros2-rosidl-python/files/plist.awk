#
# Copyright (c) 2026 LAAS/CNRS
# All rights reserved.
#
# Redistribution  and  use  in  source  and binary  forms,  with  or  without
# modification, are permitted provided that the following conditions are met:
#
#   1. Redistributions of  source  code must retain the  above copyright
#      notice and this list of conditions.
#   2. Redistributions in binary form must reproduce the above copyright
#      notice and  this list of  conditions in the  documentation and/or
#      other materials provided with the distribution.
#
# THE SOFTWARE  IS PROVIDED "AS IS"  AND THE AUTHOR  DISCLAIMS ALL WARRANTIES
# WITH  REGARD   TO  THIS  SOFTWARE  INCLUDING  ALL   IMPLIED  WARRANTIES  OF
# MERCHANTABILITY AND  FITNESS.  IN NO EVENT  SHALL THE AUTHOR  BE LIABLE FOR
# ANY  SPECIAL, DIRECT,  INDIRECT, OR  CONSEQUENTIAL DAMAGES  OR  ANY DAMAGES
# WHATSOEVER  RESULTING FROM  LOSS OF  USE, DATA  OR PROFITS,  WHETHER  IN AN
# ACTION OF CONTRACT, NEGLIGENCE OR  OTHER TORTIOUS ACTION, ARISING OUT OF OR
# IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
#
#                                           Anthony Mallet on Wed Jun 24 2026
#

# See interfaces/ros2-rosidl/files/plist-.awk for details
END { rosidl_python() }

function rosidl_python(	i, n, path, base) {
    for(i in rosidls) {
        n = split(i, path)
        base = decamel(path[n-1])
        rosidl_generator_py(path[2], path[n-2], base)
    }
    if (i) here("ros2-rosidl-python")
}

function rosidl_generator_py(pkg, dir, base)
{
    if (!pkgversion("ros2-rosidl-python")) return

    generated[PYTHON_SITELIB, pkg, "__init__.py"]

    generated[PYTHON_SITELIB, pkg, dir, "__init__.py"]
    generated[PYTHON_SITELIB, pkg, dir, "_" base ".py"]
    generated[PYTHON_SITELIB, pkg, dir, "_" base "_s.c"]

    if (pkgversion("ros2-rosidl-python<0.26")) return

    generated[PYTHON_SITELIB, pkg, "py.typed"]
}
