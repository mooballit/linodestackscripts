#!/usr/bin/bash
#
# Test the centos deployment functions
#

test_prefetchPython()
{
    prefetchPython ${testDir} "2.7.3 2.4.6"
    assertTrue 'directory missing' "[ -d '${testDir}/Python-2.7.3' ]"
    assertTrue 'directory missing' "[ -d '${testDir}/Python-2.4.6' ]"
}

# -------------------------------------
# suite functions
#
oneTimeSetUp()
{
    # source the centos functions
    . lib-python.sh
    testDir="${SHUNIT_TMPDIR}"
    mkdir -p ${testDir}
}


# run
. ../shunit2/src/shunit2
