#! /bin/bash
# -*- mode: bash -*-

if [ $# -ne 1 ]; then
    echo "error: hostname must be specified."
    echo "bash script/expand_spec.sh <HOST>"
    exit 1
fi

HOST=${1}
HOSTDIR=vm/${HOST}
file=kvm.yml

python3 script/spec.py ${HOSTDIR}/spec.yml template/${file}.tmpl > ${HOSTDIR}/${file}
