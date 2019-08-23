#!/bin/bash
#set -e

usage="Usage: $0 <record> <name> <outdir>"

if [ $# -lt 3 ] ; then

        echo "$usage" >&2
        exit 1
fi

record=$1
name=$2
outdir=$(readlink -f "$3")

if [ ! -d $outdir ] ; then
        echo "Output directory does not exist." >&2
        echo "$usage" >&2
        exit 1
fi

cd ${outdir}
echo Downloading ${name}
wget -q https://zenodo.org/record/${record}/files/${name}.hdr
wget -q https://zenodo.org/record/${record}/files/${name}.cfl
cat md5sum.txt | grep ${name} | md5sum -c --ignore-missing

