@echo off

setlocal

::::::::::::::::::
:: Dependencies ::
::::::::::::::::::

if not exist magiskboot.exe (
    echo Downloading magiskboot...
    for /f "tokens=1,* delims=:" %%a in ('curl -ks https://api.github.com/repos/svoboda18/magiskboot/releases/latest ^| find "browser_download_url" ^| find "magiskboot.zip"') do (curl -kOL %%b)
    tar -xf magiskboot.zip
    del Magiskboot.zip
)

::::::::::::::::::::
:: Initialization ::
::::::::::::::::::::

del patched-recovery.tar >NUL 2>&1

ren *.img.lz4 recovery.img.lz4 >NUL 2>&1
ren *.img recovery.img >NUL 2>&1

if exist recovery.img.lz4 (
    echo Decompressing the lz4 image...
    magiskboot decompress recovery.img.lz4
)

if not exist recovery.img (
	echo No file found, please supply a recovery image to patch.
	pause >NUL 2>&1
    exit /b
)

::::::::::::::
:: Patching ::
::::::::::::::

mkdir temp
cd temp || exit /b

..\magiskboot unpack ../recovery.img
..\magiskboot cpio ramdisk.cpio extract
..\magiskboot hexpatch ramdisk/system/bin/recovery e10313aaf40300aa6ecc009420010034 e10313aaf40300aa6ecc0094
..\magiskboot hexpatch ramdisk/system/bin/recovery eec3009420010034 eec3009420010035
..\magiskboot hexpatch ramdisk/system/bin/recovery 3ad3009420010034 3ad3009420010035
..\magiskboot hexpatch ramdisk/system/bin/recovery 50c0009420010034 50c0009420010035
..\magiskboot hexpatch ramdisk/system/bin/recovery 080109aae80000b4 080109aae80000b5
..\magiskboot hexpatch ramdisk/system/bin/recovery 20f0a6ef38b1681c 20f0a6ef38b9681c
..\magiskboot hexpatch ramdisk/system/bin/recovery 23f03aed38b1681c 23f03aed38b9681c
..\magiskboot hexpatch ramdisk/system/bin/recovery 20f09eef38b1681c 20f09eef38b9681c
..\magiskboot hexpatch ramdisk/system/bin/recovery 26f0ceec30b1681c 26f0ceec30b9681c
..\magiskboot hexpatch ramdisk/system/bin/recovery 24f0fcee30b1681c 24f0fcee30b9681c
..\magiskboot hexpatch ramdisk/system/bin/recovery 27f02eeb30b1681c 27f02eeb30b9681c
..\magiskboot hexpatch ramdisk/system/bin/recovery b4f082ee28b1701c b4f082ee28b970c1
..\magiskboot hexpatch ramdisk/system/bin/recovery 9ef0f4ec28b1701c 9ef0f4ec28b9701c
..\magiskboot cpio ramdisk.cpio "add 0755 ramdisk/system/bin/recovery ramdisk/system/bin/recovery"
..\magiskboot repack ../recovery.img ../recovery-patched.img

cd.. || exit /b
rmdir /S /Q temp

:::::::::::::
:: Zipping ::
:::::::::::::

mkdir output
cd output || exit /b

move ..\recovery-patched.img recovery.img >NUL 2>&1
tar cvf patched-recovery.tar recovery.img >NUL 2>&1
move patched-recovery.tar ../patched-recovery.tar >NUL 2>&1

cd .. || exit /b
rmdir /S /Q output

echo.
echo Done! Flash the file 'patched-recovery.tar' to finsh installation.

pause >NUL 2>&1
exit /b