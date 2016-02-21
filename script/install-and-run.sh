#!/bin/bash

VM_NUM="$1"
VM_NAME="vm$VM_NUM"
ADB_PORT="700$VM_NUM"
FILE_PATH="$2"
PACKAGE_NAME=$(aapt dump badging "$2" | awk '/package/{gsub("name=|'"'"'","");  print $2}')

adb connect "localhost:$ADB_PORT"
adb -s "localhost:$ADB_PORT" install -r "$FILE_PATH"
adb connect "localhost:$ADB_PORT"
adb -s "localhost:$ADB_PORT" shell monkey -p "$PACKAGE_NAME" -c android.intent.category.LAUNCHER 1
