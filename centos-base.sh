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
          readline-devel
          libjpeg-devel
          openldap-devel
          "


baseInstall()
{
    yum -y groupinstall "Development Tools"
    yum -yq install ${PACKAGES}
}

enableEpel()
{
    # enable epel
    rpm -Uvh http://mirror.overthewire.com.au/pub/epel/6/i386/epel-release-6-8.noarch.rpm

    # and update the system
    yum -y update
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

enableEpel
baseInstall
prefetchPython /opt
