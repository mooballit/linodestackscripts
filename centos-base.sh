#!/bin/bash
#
# This stack script installs the base system we need for deploying zope
# servers. It installs
#
#   * Development packages to compile python
#   * additional important packages for python/Zope/Plone
#   * installs Epel for Centos 6
#
PACKAGES="vim-enhanced
          git
          readline-devel"
GROUPS="'Development Tools'"


baseInstall()
{
    yum groupinstall ${GROUPS}
    yum -yq install ${PACKAGES}
}

enableEpel()
{
    rpm -Uvh http://mirror.overthewire.com.au/pub/epel/6/i386/epel-release-6-8.noarch.rpm
}

#
# We prefetch all python tarballs in order to be able to just go/compile
# and install them
#
# @param1: directory where to save and compile python
#
prefetchPython()
{
    baseDir=$1
    URL=http://python.org/ftp/python/2.7.3/Python-2.7.3.tar.bz2
    archiveName=$(basename ${URL})
    unpArchiveName=${archiveName/.tar.bz2/}

    wget $URL -O $baseDir/${archiveName};
    cd $baseDir;
    tar xjf $baseDir/${archiveName};
    cd ${unpArchiveName};
    ./configure --prefix=$baseDir/python/${unpArchiveName};
}

baseInstall
enableEpel
prefetchPython
