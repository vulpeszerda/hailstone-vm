#!/bin/bash

VM_NUM="$1"
VM_NAME="vm$VM_NUM"
ADB_PORT="700$VM_NUM"

adb connect "localhost:$ADB_PORT"
adb -s "localhost:$ADB_PORT" shell wm size 480x800
adb connect "localhost:$ADB_PORT"
adb -s "localhost:$ADB_PORT" shell wm density 160
adb connect "localhost:$ADB_PORT"
adb -s "localhost:$ADB_PORT" shell wm overscan 0,0,0,0
