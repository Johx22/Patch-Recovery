#!/bin/bash

if [ -f recovery.img.lz4 ];then
	lz4 -B6 --content-size -f recovery.img.lz4 recovery.img
fi

#off=$(grep -ab -o SEANDROIDENFORCE recovery.img |tail -n 1 |cut -d : -f 1)
#dd if=recovery.img of=r.img bs=4k count=$off iflag=count_bytes
cp recovery.img r.img

if [ ! -f phh.pem ];then
    openssl genrsa -f4 -out phh.pem 4096
fi
