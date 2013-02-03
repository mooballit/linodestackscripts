# Python library functions for deployment


# We prefetch all python tarballs in order to be able to just go/compile
# and install them
#
# @param1: directory where to save and compile python
# @param2: correspond to a list of valid python releases, e.g. 2.7.3 2.4.6
#
prefetchPython()
{
    baseDir=$1
    versions=$2

    for i in ${versions}; do
        URL=http://python.org/ftp/python/$i/Python-$i.tar.bz2
        archiveName=$(basename ${URL})

        wget ${URL} -O ${baseDir}/${archiveName};
        cd $baseDir;
        tar xjf $baseDir/${archiveName};
    done
}

