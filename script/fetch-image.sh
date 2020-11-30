#! /bin/bash
# -*- mode: bash -*-

URL=https://cloud-images.ubuntu.com/releases/18.04/release/ubuntu-18.04-server-cloudimg-amd64.img
OUTPUT=ubuntu-18.04-server.qcow2

wget ${URL} -O ${OUTPUT}
