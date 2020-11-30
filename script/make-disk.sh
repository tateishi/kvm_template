#! /bin/bash
# -*- mode: bash -*-

BASE=ubuntu-18.04-server.qcow2
DISK=kvm01.qcow2
SIZE=16G

qemu-img create \
         -b ${BASE} \
         -f qcow2 \
         ${DISK} \
         ${SIZE}
