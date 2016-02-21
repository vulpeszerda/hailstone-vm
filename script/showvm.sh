#!/bin/bash

VM_NUM="$1"
VM_NAME="vm$VM_NUM"
vboxmanage showvminfo "$VM_NAME"
