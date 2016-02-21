#!/bin/bash

VM_NUM="$1"
VM_NAME="vm$VM_NUM"
ADB_PORT="700$VM_NUM"

vboxheadless --startvm "$VM_NAME"&
