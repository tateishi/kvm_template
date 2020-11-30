#! /bin/bash
# -*- mode: bash -*-

if [ $# -ne 1 ]; then
    echo "error: hostname must be specified."
    echo "bash script/vm_start.sh <HOST>"
    exit 1
fi

HOST=${1}
HOSTDIR=vm/${HOST}

bash script/expand_spec.sh ${HOST}
bash script/expand_template.sh ${HOST}

cd ${HOSTDIR}

bash make-cidata.sh
bash make-disk.sh
bash make-vm.sh
