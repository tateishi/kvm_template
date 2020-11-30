#! /bin/bash
# -*- mode: bash -*-

USERDATA=cloud-init/user-data
METADATA=cloud-init/meta-data
OUTPUT=cloud-init/userdata.iso

echo "instance-id: `uuidgen`" > ${METADATA}

genisoimage -output ${OUTPUT} -volid cidata -joliet -rock ${USERDATA} ${METADATA}
