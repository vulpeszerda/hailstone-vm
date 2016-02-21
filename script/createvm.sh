#!/bin/bash

VM_NUM="$1"
VM_NAME="vm$VM_NUM"
PORT="300$VM_NUM"
VDI_ORIGIN='../vdi/Android-x86 5.1 rc1.vdi'
VDI_PATH="../vdi/$1.vdi"
ADB_PORT="700$VM_NUM"

rsync -ah --progress "$VDI_ORIGIN" "$VDI_PATH"
vboxmanage internalcommands sethduuid "$VDI_PATH"
vboxmanage createvm --name "$VM_NAME" --register
vboxmanage modifyvm "$VM_NAME" --memory 1024 --acpi on
vboxmanage modifyvm "$VM_NAME" --ostype linux26_64
vboxmanage storagectl "$VM_NAME" --name "IDE" --add ide
vboxmanage storageattach "$VM_NAME" --storagectl "IDE" --port 0 --device 0 --type hdd --medium "$VDI_PATH"
# vboxmanage controlvm "$VM_NAME" setvideomodehint 768 1280 32
vboxmanage modifyvm "$VM_NAME" --mouse usbtablet
vboxmanage modifyvm "$VM_NAME" --nic1 nat
vboxmanage modifyvm "$VM_NAME" --natpf1 adb,tcp,*,"$ADB_PORT",*,5555
vboxmanage modifyvm "$VM_NAME" --vrdemulticon on
vboxmanage modifyvm "$VM_NAME" --vrdevideochannel on
vboxmanage modifyvm "$VM_NAME" --vrdevideochannelquality 75
vboxmanage modifyvm "$VM_NAME" --vrde on
vboxmanage modifyvm "$VM_NAME" --vrdeport "$PORT"
vboxmanage modifyvm "$VM_NAME" --vrdeproperty "Security/Method=negotiate"
vboxmanage modifyvm "$VM_NAME" --vrdeproperty "Security/CACertificate=../tls/ca_cert.pem"
vboxmanage modifyvm "$VM_NAME" --vrdeproperty "Security/ServerCertificate=../tls/server_cert.pem"
vboxmanage modifyvm "$VM_NAME" --vrdeproperty "Security/ServerPrivateKey=../tls/server_key_private.pem"
