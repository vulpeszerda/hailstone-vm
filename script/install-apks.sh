#!/bin/bash

VM_NUM="$1"
VM_NAME="vm$VM_NUM"
ADB_PORT="700$VM_NUM"

for file in $(ls -1 ../apk) ;
do
	adb connect "localhost:$ADB_PORT"
	adb -s "localhost:$ADB_PORT" install -r "$file"
done
