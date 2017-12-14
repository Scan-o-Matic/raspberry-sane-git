# ScanTastique

SANE image that can be built for ARMv7 on ARMv7

* build with
```
docker build -t scantastique .
```

* run to check it gets same versions for SANE (should say git on first):
```
docker run -v /dev/bus/usb:/dev/bus/usb --privileged scantastique scanimage -V
```

* run to check it finds your usb scanner:
```
docker run -v /dev/bus/usb:/dev/bus/usb --privileged scantastique scanimage -L
```
