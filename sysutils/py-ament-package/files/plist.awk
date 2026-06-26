# sysutils/py-ament-package/plist.awk
#                                           Anthony Mallet on Fri Jun 12 2026
#
$1 == "share" && $(NF-1) == "local_setup" {
    h = here("py-ament-package")
    sub(/[^.]*$/, "")
    if (plist_collapse) plist[$0 "*"] = h

    generated[$0 "bash"] = h
    generated[$0 "dsv"] = h
    generated[$0 "sh"] = h
    generated[$0 "zsh"] = h
    if (pkgversion("py*-ament-package<0.18.3")) next

    generated[$0 "fish"] = h
    next
}
