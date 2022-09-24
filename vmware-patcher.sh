#!/bin/bash
set -e
productver="`vmware -v | cut -f2,3 -d' ' | tr ' ' - | tr '[:upper:]' '[:lower:]'`"

if [ -d ./vmware-host-modules ] 
then
	cd ./vmware-host-modules
	git fetch
else	
	git clone "https://github.com/mkubecek/vmware-host-modules.git"
	cd ./vmware-host-modules
fi

git checkout "$productver"
make
sudo make install
sudo /etc/init.d/vmware restart
