#!/bin/bash

################
# Dependencies #
################

echo "Checking for dependencies..."

if [ -e "/etc/debian_version" ]; then  # Checking to determine the linux distro.
  sudo apt install curl unzip tar -y &>/dev/null
elif [ -e "/etc/arch-release" ]; then
  sudo pacman -Syu curl unzip tar &>/dev/null
else
  echo "No available package manager found, this program cannot run on your computer."
  exit 1
fi

if ! [ -e magiskboot ]; then  # Downloads Magiskboot directly from Github.
    echo "Download magiskboot..."
    curl -kOL https://github.com/Johx22/Patch-Recovery/raw/master/magiskboot
fi

##################
# Initialization #
##################

rm -rf patched-recovery.tar  # Deleting the old patched recovery if exists.

mv -- *.img.lz4 recovery.img.lz4 &>/dev/null  # Renames the lz4 file if found.
mv -- *.img recovery.img &>/dev/null  # Renames the img file if found.

if [ -e recovery.img.lz4 ];then  # Decompresses the recovery file if in lz4 format.
  echo "Decompressing the lz4 image..."
	./magiskboot decompress recovery.img.lz4
fi

if ! [ -e recovery.img ]; then  # Checking for the existence of the file passed as an argument.
	echo "No file found, please supply a recovery image file to patch."
	exit 1
fi

############
# Patching #
############

mkdir temp
cd temp || exit 1

../magiskboot unpack ../recovery.img
../magiskboot cpio ramdisk.cpio extract
../magiskboot hexpatch system/bin/recovery e10313aaf40300aa6ecc009420010034 e10313aaf40300aa6ecc0094
../magiskboot hexpatch system/bin/recovery eec3009420010034 eec3009420010035
../magiskboot hexpatch system/bin/recovery 3ad3009420010034 3ad3009420010035
../magiskboot hexpatch system/bin/recovery 50c0009420010034 50c0009420010035
../magiskboot hexpatch system/bin/recovery 080109aae80000b4 080109aae80000b5
../magiskboot hexpatch system/bin/recovery 20f0a6ef38b1681c 20f0a6ef38b9681c
../magiskboot hexpatch system/bin/recovery 23f03aed38b1681c 23f03aed38b9681c
../magiskboot hexpatch system/bin/recovery 20f09eef38b1681c 20f09eef38b9681c
../magiskboot hexpatch system/bin/recovery 26f0ceec30b1681c 26f0ceec30b9681c
../magiskboot hexpatch system/bin/recovery 24f0fcee30b1681c 24f0fcee30b9681c
../magiskboot hexpatch system/bin/recovery 27f02eeb30b1681c 27f02eeb30b9681c
../magiskboot hexpatch system/bin/recovery b4f082ee28b1701c b4f082ee28b970c1
../magiskboot hexpatch system/bin/recovery 9ef0f4ec28b1701c 9ef0f4ec28b9701c
../magiskboot cpio ramdisk.cpio 'add 0755 system/bin/recovery system/bin/recovery'
../magiskboot repack ../recovery.img ../recovery-patched.img

cd .. || exit 1
rm -rf temp

###########
# Zipping #
###########

mkdir output
cd output || exit 1

mv ../recovery-patched.img recovery.img
tar cvf patched-recovery.tar recovery.img
mv patched-recovery.tar ../patched-recovery.tar

cd .. || exit 1
rm -rf output

echo ""
echo "Done! Flash the file 'patched-recovery.tar.md5' to finsh installation."

exit 0