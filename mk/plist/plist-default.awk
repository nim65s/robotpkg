# mk/plist/plist-default.awk
#                                           Anthony Mallet on Thu Aug 17 2023
#

# default action is to record as plist member (preserving order)
{ plist[$0] = NR }

# Filter PLIST
END {
    nsorted = split("", sorted)

    for(f in generated) delete plist[f]

    for(f in plist)
        sorted[++nsorted] = (plist[f] ? plist[f]:NR+1) "\001" f
    if (plist_expand)
        for(f in generated)
            sorted[++nsorted] = (generated[f] ? generated[f]:NR+1) "\001" f

    qsort_plist(sorted, 1, nsorted)
    for(i = 1; i <= nsorted; i++) {
        sub(/^.*\001/, "", sorted[i])
        print sorted[i]
    }
}
