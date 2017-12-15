# Raspberry Sane Git

Raspbian based image that clones the SANE git repository.
Image that can be built on and for ARMv7

It injects support for Epson V700 and Epson V800 scanners into the settings

* build with
```
docker build -t sane-git .
```

* run to check it gets same versions for SANE (should say git on first):
```
docker run -v /dev/bus/usb:/dev/bus/usb --privileged sane-git scanimage -V
```

* run to check it finds your usb scanner:
```
docker run -v /dev/bus/usb:/dev/bus/usb --privileged sane-git scanimage -L
```

* run to grab a test image for V700/V800 special TPU mode. Note that since scanimage outputs the image to stdout, the image `test.tiff` will appear in your current directory.

```
docker run -v /dev/bus/usb:/dev/bus/usb --privileged sane-git scanimage --mode gray --source TPU8x10 --resolution 600 --format tiff > test.tiff
