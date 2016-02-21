#!/bin/bash

VM_NAME="$1"
vboxmanage unregistervm --delete "$VM_NAME"
