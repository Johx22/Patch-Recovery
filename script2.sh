#!/bin/bash

mkdir unpack
cd unpack
../magiskboot unpack ../r.img
../magiskboot cpio ramdisk.cpio extract
# Reverse fastbootd ENG mode check
~runner/work/Patch-Recovery/Patch-Recovery/magiskboot hexpatch system/bin/recovery e10313aaf40300aa6ecc009420010034 e10313aaf40300aa6ecc0094 # 20 01 00 35
~runner/work/Patch-Recovery/Patch-Recovery/magiskboot hexpatch system/bin/recovery eec3009420010034 eec3009420010035
~runner/work/Patch-Recovery/Patch-Recovery/magiskboot hexpatch system/bin/recovery 3ad3009420010034 3ad3009420010035
~runner/work/Patch-Recovery/Patch-Recovery/magiskboot hexpatch system/bin/recovery 50c0009420010034 50c0009420010035
~runner/work/Patch-Recovery/Patch-Recovery/magiskboot hexpatch system/bin/recovery 080109aae80000b4 080109aae80000b5
~runner/work/Patch-Recovery/Patch-Recovery/magiskboot hexpatch system/bin/recovery 20f0a6ef38b1681c 20f0a6ef38b9681c
~runner/work/Patch-Recovery/Patch-Recovery/magiskboot hexpatch system/bin/recovery 23f03aed38b1681c 23f03aed38b9681c
~runner/work/Patch-Recovery/Patch-Recovery/magiskboot hexpatch system/bin/recovery 20f09eef38b1681c 20f09eef38b9681c
~runner/work/Patch-Recovery/Patch-Recovery/magiskboot hexpatch system/bin/recovery 26f0ceec30b1681c 26f0ceec30b9681c
~runner/work/Patch-Recovery/Patch-Recovery/magiskboot hexpatch system/bin/recovery 24f0fcee30b1681c 24f0fcee30b9681c
~runner/work/Patch-Recovery/Patch-Recovery/magiskboot hexpatch system/bin/recovery 27f02eeb30b1681c 27f02eeb30b9681c
~runner/work/Patch-Recovery/Patch-Recovery/magiskboot hexpatch system/bin/recovery b4f082ee28b1701c b4f082ee28b970c1
~runner/work/Patch-Recovery/Patch-Recovery/magiskboot hexpatch system/bin/recovery 9ef0f4ec28b1701c 9ef0f4ec28b9701c
~runner/work/Patch-Recovery/Patch-Recovery/magiskboot hexpatch system/bin/recovery 9ef00ced28b1701c 9ef00ced28b9701c
~runner/work/Patch-Recovery/Patch-Recovery/magiskboot hexpatch system/bin/recovery 2001597ae0000054 2001597ae1000054  # ccmp w9, w25, #0, eq ; b.e #0x20 ===> b.ne #0x20
~runner/work/Patch-Recovery/Patch-Recovery/magiskboot hexpatch system/bin/recovery 24f0f2ea30b1681c 24f0f2ea30b9681c
~runner/work/Patch-Recovery/Patch-Recovery/magiskboot hexpatch system/bin/recovery 41010054a0020012f44f48a9 4101005420008052f44f48a9
~runner/work/Patch-Recovery/Patch-Recovery/magiskboot cpio ramdisk.cpio 'add 0755 system/bin/recovery system/bin/recovery'
~runner/work/Patch-Recovery/Patch-Recovery/magiskboot repack ../r.img new-boot.img
cp new-boot.img ../recovery-patched.img
