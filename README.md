# Patch-Recovery
This CI service patches recovery images of Samsung to enable Fastbootd. Based on Phh's [script](https://github.com/phhusson/samsung-galaxy-a51-gsi-boot)

# How to use:
- Upload your recovery to https://www.filesend.jp/l/en-US/. Once uploaded right click on the Download button and copy the URL
- Go to .github/workflows/recovery.yml and edit the RECOVERY_URL with the URL you just copied
- Head over to Actions tab and star the repo. Click Actions again
- The Patching process will start 
- You will get a URL at the end of the process from where you can download the Patched Recovery

# Credits
- [Phhusson](https://github.com/phhusson) Without his script nothing would be possible at the first place
- [James Nguyen](https://github.com/thongass000) Helping me in simplyfying the scripts and tweaking it
