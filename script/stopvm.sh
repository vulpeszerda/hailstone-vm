#!/bin/bash

VM_NAME="$1"
vboxmanage controlvm "$VM_NAME" poweroff
