#!/bin/bash

cd $( dirname $0 )

COMMIT=cafce902a73c1050474a62feff83e428bbbee5f4
FILEURL="https://gitlab.xiph.org/xiph/libao/-/archive/$COMMIT/libao-$COMMIT.tar.gz"
FILEPATH=libao-$COMMIT.tar.gz
DIRPATH=libao-$COMMIT

#
# prepare build directory
#
if [[ ! -d build/ao ]]
then
	mkdir -p build/ao
fi

#
# source file downlaod
#
if [[ ! -f build/$FILEPATH ]]
then
	curl -s -o build/$FILEPATH $FILEURL
fi

if [[ ! -f build/$FILEPATH ]]
then
	echo "Error: cannot download $FILEURL."
	exit 1
fi

#
# extract
#
cd build
tar xzvf $FILEPATH
cd ..

if [[ ! -d build/$DIRPATH ]]
then
	echo "Error: cannot extract $FILEPATH."
	exit 1
fi

#
# copy to required files
#

# .c
cp -f build/$DIRPATH/src/config.c    build/
cp -f build/$DIRPATH/src/ao_wmm.c    build/
cp -f build/$DIRPATH/src/ao_null.c   build/
cp -f build/$DIRPATH/src/audio_out.c build/
cp -f windows/dllmain.cpp            build/
 
# .h
cp -f windows/targetver.h                    build/
cp -f build/$DIRPATH/include/ao/ao.h         build/ao/
cp -f build/$DIRPATH/include/ao/ao_private.h build/ao/
cp -f windows/os_types.h                     build/ao/

#
# patch
#
cd build
while read line
do
	patch -u -p0 < $line
done < <(find ../patch | sort | grep -E '\.patch$')

