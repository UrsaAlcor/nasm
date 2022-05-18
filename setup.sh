#!/bin/bash

origin=$(pwd)
version=$(cd nasm && git describe --tags --abbrev=0)

frags=(${version//-/ })
version=${frags[1]}

package=nasm
install=$origin/lmod/dist/$(arch)/$package/$version
module=$origin/lmod/modules/$(arch)/$package/

mkdir -p $install
mkdir -p $module

NJ=${NJ:-$(nproc)}
# ===============

cd $package

./autogen.sh

./configure --prefix="$install" > /dev/null

make -j$NJ > /dev/null
make install

cd ..

# Setup the module file
cp nasm.lua $module/$version.lua

sed -i -e "s@\${package}@nasm@g" $module/$version.lua
sed -i -e "s@\${version}@$version@g" $module/$version.lua