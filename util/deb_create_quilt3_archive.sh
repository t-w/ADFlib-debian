#!/bin/bash

#
# Create tar.gz archive (quilt3) for ADFlib project
#
# !!! Execute in the main directory !!
#

if [ "${0}" != "util/deb_create_quilt3_archive.sh" ]
then
    echo "The script must be executed in the main project directory - aborting..."
    exit 1
fi

if [ ! -d build/ADFlib ]
then
    echo "Project directory build/ADFlib/ not found - aborting..."
    exit 1
fi

if [ ! -d build/ADFlib/debian ]
then
    echo "Debian packaging configuration (build/ADFlib/debian) not found - aborting..."
    exit 1
fi

# validate if extracted string is a valid version!
# TO ADD
#check_version()
#{
# ...
#}

VERSION_DEBIAN=`grep -e '^[a-z]' build/ADFlib/debian/changelog \
            | cut -d'(' -f 2 | cut -d')' -f 1`
VERSION=`echo $VERSION_DEBIAN | cut -d'-' -f 1`

SRC_ARCHIVE="build/adflib_${VERSION}.orig.tar.gz"
echo -e "\nCreating source archive:\n" \
     "  version: $VERSION\n" \
     "  archive: $SRC_ARCHIVE\n"

#check_version $VERSION

tar cvz -f $SRC_ARCHIVE -C build/ADFlib `ls build/ADFlib`
#    `ls | grep -v archive packaging`
#    `ls -a | grep -v "^\.git$" | grep -v debian`
#    .gitlab-ci.yml
