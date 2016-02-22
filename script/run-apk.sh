#!/bin/bash

VM_NUM="$1"
ADB_PORT="800$VM_NUM"
PACKAGE_NAME="$2"

adb connect "localhost:$ADB_PORT"
adb -s "localhost:$ADB_PORT" shell monkey -p "$PACKAGE_NAME" -c android.intent.category.LAUNCHER 1
