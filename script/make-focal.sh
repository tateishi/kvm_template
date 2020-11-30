# -*- mode: bash -*-

# make kvm and install ubuntu 20.04 (focal)

virt-install \
    --name focal \
    --ram 2048 \
    --vcpus 2 \
    --hvm \
    --arch x86_64 \
    --os-type linux \
    --disk focal.img,size=10 \
    --network bridge=virbr0 \
    --graphics none \
    --console pty,target_type=serial \
    --cdrom ubuntu-20.04.iso
    --extra-args 'console=ttyS0,115200n8 serial'
