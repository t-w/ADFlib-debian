#!/bin/bash
#
# Assembles the project to build from:
# - original source (ADFlib/)
# - debian packaging configuration (debian/)
#

ADFLIB_PROJECT_FILES=`find ADFlib/ -maxdepth 1 | tail -n +2 | grep -v .git | grep -v archive | grep -v packaging`

cp -aRpv $ADFLIB_PROJECT_FILES debian build/ADFlib
