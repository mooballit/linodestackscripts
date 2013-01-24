#!/usr/bin/bash
#
# Test the centos deployment functions
#

test_prefetchPython()
{
    prefetchPython ${testDir}
    assertTrue 'directory missing' "[ -d '${testDir}/python.tar.bz2' ]"
}

# -------------------------------------
# suite functions
#
oneTimeSetUp()
{
    # source the centos functions
    . centos-base.sh
    testDir="${SHUNIT_TMPDIR}/pythontest"
}

tearDown()
{
    rm -fr "${testDir}"
}

# run
. ../shunit2/src/shunit2
