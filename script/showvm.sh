#!/bin/bash

VM_NAME="$1"
vboxmanage showvminfo "$VM_NAME"
