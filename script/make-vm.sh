#! /bin/bash
#-*- mode: bash -*-

NAME=kvm01
RAM=1024
CPUS=2
FILE=kvm01.qcow2
CIDATA=cloud-init/userdata.iso
NETWORK=bridge:lxdbr0

virt-install \
    --name ${NAME} \
    --ram ${RAM} \
    --vcpus ${CPUS} \
    --arch x86_64 \
    --os-type linux \
    --os-variant ubuntu18.04 \
    --hvm \
    --virt-type kvm \
    --file ${FILE} \
    --cdrom ${CIDATA} \
    --boot hd \
    --network ${NETWORK} \
    --graphics none \
    --serial pty \
    --console pty \
    --autostart \
    --noreboot
