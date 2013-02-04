#!/bin/bash
#
# This stack script installs the base system we need for deploying zope
# servers. It installs
#
#   * Development packages to compile python
#   * additional important packages for python/Zope/Plone
#   * installs Epel for Centos 6
#
# <udf name="pythonversions" label="Python Versions to prefetch" manyOf="2.7.3, 2.6.8, 2.4.6, 2.3.7" default="2.7.3">
#
. lib-python.sh

PACKAGES="vim-enhanced
          git
          readline-devel
          libjpeg-devel
          openldap-devel
          mysql-devel
          bzip2
          bzip2-devel
          "


baseInstall()
{
    yum -yq groupinstall "Development Tools"
    yum -yq install ${PACKAGES}
}

enableEpel()
{
    # enable epel
    rpm -Uvh http://mirror.overthewire.com.au/pub/epel/6/i386/epel-release-6-8.noarch.rpm

    # and update the system
    echo "Updating the system"
    yum -yq update
}

enableEpel
baseInstall
prefetchPython /opt $PYTHONVERSIONS
