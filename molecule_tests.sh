#!/bin/bash -eu

# MOLECULE_DISTROS="centos7 centos6 ubuntu1804 ubuntu1604 ubuntu1404 ubuntu1204 debian9 debian8 fedora27"
# MOLECULE_DISTROS="centos6 centos7 centos8 ubuntu1604 ubuntu1804	ubuntu2004 ubuntu2104 ubuntu2204 debian9 debian10 debian11"
MOLECULE_DISTROS="centos7 centos8 ubuntu1604 ubuntu1804	ubuntu2004 ubuntu2104 ubuntu2204"

for MOLECULE_DISTRO in $MOLECULE_DISTROS; do
  echo "*** $MOLECULE_DISTRO"
  export MOLECULE_DISTRO
  molecule test
done
