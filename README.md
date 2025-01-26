# Similar script
You can also refer this [script](https://github.com/engineer4t/fastboot-patcher)


# Patch-Recovery
This CI service patches recovery images of Samsung to enable Fastbootd. Based on Phh's [script](https://github.com/phhusson/samsung-galaxy-a51-gsi-boot)

# How to use:
- Fork this repo.
- Extract your recovery.img.lz4 and upload recovery.img or *img.lz4 to nextcloud or any other file hosting sites. Once uploaded right click on the Download button and copy the URL.
- Head over to Actions tab. Click on RECOVERY -> Run workflow. Insert the copied URL in the RECOVERY URL field and Start the workflow
- The Patching process will start
- A Patched-Recovery.zip will be uploaded at the end of the process. Download it and extract your patched recovery image. The Image will already also be repacked to .tar for flashing directly through Odin
![](https://s3.bmp.ovh/imgs/2022/04/19/91ef3a3ee9255e9c.png)
- Flash vbmeta_disabled_r if needed

```
ODIN AP Slot: Recovery.tar.md5
ODIN User Slot: vbmeta_disabled_r.tar
```

# Important note
- Make sure that the uploaded file can downloaded with wget command and will download a correct file. Nextcloud with public link works fine if you open the link on web and copy the url from the download button.

# Credits
- [Phhusson](https://github.com/phhusson) Without his script nothing would be possible at the first place
- [James Nguyen](https://github.com/thongass000) Helping me in simplifying the scripts and tweaking it
