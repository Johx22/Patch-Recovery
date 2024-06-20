#!/bin/bash

if [ -f 07l1i1.img.lz4 ];then
	lz4 -B6 --content-size -f 07l1i1.img.lz4 07l1i1.img
fi

off=$(grep -ab -o SEANDROIDENFORCE 07l1i1.img |tail -n 1 |cut -d : -f 1)
dd if=07l1i1.img of=r.img bs=4k count=$off iflag=count_bytes

if [ ! -f phh.pem ];then
    openssl genrsa -f4 -out phh.pem 4096
fi
