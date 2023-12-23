# Patch-Recovery
This CI service patches recovery images of Samsung to enable Fastbootd. Based on Phh's [script](https://github.com/phhusson/samsung-galaxy-a51-gsi-boot)

# How to use:
## Method 1 - Using GitHub
- Fork this repo.
- Extract your recovery.img.lz4 and upload recovery.img or recovery.img.lz4 to [transfer.sh](https://transfer.sh/) or any other file hosting sites. Once uploaded right click on the Download button and copy the URL. Avoid Gdrive links for now as it has been causing an error in some cases. 
- Head over to Actions tab. Click on RECOVERY -> Run workflow. Insert the copied URL in the RECOVERY URL field and Start the workflow.
- The Patching process will start
- The file Patched-Recovery.zip will be uploaded at the end of the process. Download it and extract your patched recovery image. The Image will already also be repacked to .tar for flashing directly through Odin.
![](https://s3.bmp.ovh/imgs/2022/04/19/91ef3a3ee9255e9c.png)
- Flash vbmeta_disabled_r if needed

## Method 2 - Running Locally (Supports Windows and Linux)
- Download the appropriate file, either patchrecovery.bat (Windows) or patchrecovery.sh (Linux).
- Place the recovery image (recovery.img or recovery.img.lz4) in the same directory as the script.
- Open a command-line in the same directory and run the script by typing "patchrecovery".
- The file patched-recovery.tar will be created and can now be flashed using a program such as Odin.

# Credits
- [Phhusson](https://github.com/phhusson) Without his script nothing would be possible in the first place.
- [James Nguyen](https://github.com/thongass000) Helping me in simplifying the scripts and tweaking it.