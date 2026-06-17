# mk/plist/plist-functions.awk
#                                           Anthony Mallet on Thu Aug 17 2023
#

# --- Filter PLIST ---------------------------------------------------------
#
# The script can be invoked with 'expand' or 'collapse' as its sole argument.
#
# It acts as a PLIST or PRINT_PLIST filter by scanning through stdin and
# producing the filtered output on stdout according generators rules.
# . In 'expand' mode, it outputs all input files as well as generated files;
# . In 'collapse' mode, it filters out those generated files from input.
#
# This script is not standalone (it's a noop as such) and need further code
# input by generator via PLIST_GENERATORS set by individual packages.
#
function usage()
{
    print "Usage:" > "/dev/stderr"
    print "	" ARGV[0] " -f ... expand" > "/dev/stderr"
    print "	" ARGV[0] " -f ... collapse" > "/dev/stderr"
}

BEGIN {
    # check arguments
    if (ARGC != 2) { usage(); exit 2; }

    if (ARGV[1] == "expand") plist_expand = 1
    else if (ARGV[1] == "collapse") plist_collapse = 1
    else { usage(); exit 2; }

    split(ENVIRON["PKGVERSIONS"], pkgversionlist, " ")

    # force stdin scanning
    ARGV[1] = "-"

    # dealing mostly with filenames, split input at `/' or `.'
    FS="[./]"; OFS="/"; SUBSEP="/"
}


# --- here -----------------------------------------------------------------
#
# Return NR for plist ordering, record a filter name for a comment output
#
function here(name)
{
    if (name) plist["@comment filtered by " name] = 1
    return NR
}


# --- pkgversion ------------------------------------------------------------
#
# Test if a given dependency matches target.
#
function pkgversion(target,	p)
{
    # same tests will be done for each input file, so caching helps a bit
    if (target in pcache_) return pcache_[target]

    for (p in pkgversionlist)
        if (pmatch(target, pkgversionlist[p])) return pcache_[target] = 1
    return pcache_[target] = 0
}


# --- decamel --------------------------------------------------------------
#
# Convert CamelCase to snake_case (with ros idea of this task)
#
function decamel(str)
{
    while(match(str, /[^_][A-Z][a-z0-9]/))
        str = substr(str, 1, RSTART) "_" substr(str, RSTART+1)
    while(match(str, /[a-z0-9][A-Z]/))
        str = substr(str, 1, RSTART) "_" substr(str, RSTART+1)
    return tolower(str)
}


# --- join -----------------------------------------------------------------
#
# join(array, start, end, separator) concatenates an array of strings
# with a separator and returns the concatenated string.  It is the
# inverse of the built-in split() function.
#
function join(array, start, end, separator,	i, str) {
    str = array[start]
    for (i = start + 1; i <= end; i++)
        str = str separator array[i]
    return str
}


# --- qsort_plist ----------------------------------------------------------
#
function qsort_plist(array, left, right,	part, n) {
    if (left >= right) return
    n = 0
    part[n++] = left
    part[n++] = right
    while(n) {
        right = part[--n]
        left = part[--n]
        p = qsort_pivot(array, left, right)

        if (p > left) {
            part[n++] = left
            part[n++] = p
        }
        if (p + 1 < right) {
            part[n++] = p + 1
            part[n++] = right
        }
    }
}

function qsort_less(a, b,	na, nb) {
    na = int(a); nb = int(b)
    return na == nb ? ""a < ""b : na < nb;
}

function qsort_pivot(array, left, right,	pivot, i, j, s) {
    pivot = array[int((left + right)/2)]
    i = left - 1
    j = right + 1
    for(;;) {
        while(qsort_less(array[++i], pivot));
        while(qsort_less(pivot, array[--j]));
        if (i >= j) return j

        s = array[i]
        array[i] = array[j]
        array[j] = s
    }
}
