#!/bin/bash

#QT_BASE_DIR=/home/harald/git-repos/qt5/qtbase
QT_BASE_DIR=/usr/local/Qt-5.6.1
export QTDIR=$QT_BASE_DIR
export PATH=$QT_BASE_DIR/bin:$PATH

if [[ $(uname -m) == "x86_64" ]]; then
  export LD_LIBRARY_PATH=$QT_BASE_DIR/lib/x86_64-linux-gnu:$QT_BASE_DIR/lib:$LD_LIBRARY_PATH
else
  export LD_LIBRARY_PATH=$QT_BASE_DIR/lib/i386-linux-gnu:$QT_BASE_DIR/lib:$LD_LIBRARY_PATH
fi

export PKG_CONFIG_PATH=$QT_BASE_DIR/lib/pkgconfig:$PKG_CONFIG_PATH

TEST=`echo $0 | grep wrapper`
if [ "$TEST" != "" ]; then
   exec `echo $0 | sed s/-wrapper//` $*
fi
