#!/bin/bash

VM_NAME="$1"
vboxheadless --startvm "$VM_NAME"&
