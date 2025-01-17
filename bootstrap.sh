#!/bin/sh

INSTALL_HOME=
if [ $# -gt 0 ]; then
	INSTALL_HOME=$1
fi

if [ "$INSTALL_HOME"X == "X" ]; then
	INSTALL_HOME=$HOME/CUnitHome
fi

autoreconf -i -f

if [ $? -ne 0 ]; then
	echo "Automake/Autoconf returned with error."
	exit 1
fi

mkdir -p $INSTALL_HOME
if [ $# -gt 0 ]; then
	./configure --srcdir=`pwd` --prefix=$INSTALL_HOME --enable-debug --enable-automated --enable-basic --enable-console --enable-examples --enable-test
else
	./configure --srcdir=`pwd` --prefix=$INSTALL_HOME --enable-debug --enable-memtrace --enable-automated --enable-basic --enable-console --enable-examples --enable-test
fi
