#! /bin/bash
# -*- mode: bash -*-

if [ $# -ne 1 ]; then
    echo "error: hostname must be specified."
    echo "bash script/expand_template.sh <HOST>"
    exit 1
fi

HOST=${1}
HOSTDIR=vm/${HOST}

for file in meta-data user-data network-config make-cidata.sh make-disk.sh make-vm.sh
do
    python3 script/jinja2text.py ${HOSTDIR}/kvm.yml template/${file}.tmpl > ${HOSTDIR}/${file}
done
