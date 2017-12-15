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
