FROM raspbian/jessie
RUN apt-get update
RUN apt-get -y install libusb-dev build-essential libsane-dev git-core
RUN git clone git://git.debian.org/sane/sane-backends.git /tmp/sane-backends
WORKDIR /tmp/sane-backends
RUN ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
RUN make
RUN rm /usr/lib/arm-linux-gnueabihf/libsane.so.1
RUN make install
RUN echo "usb 0x4b8 0x12c" >> /etc/sane.d/epson2.conf
RUN echo "usb 0x4b8 0x151" >> /etc/sane.d/epson2.conf
CMD scanimage --mode gray --source TPU8x10 --resolution 600 --format tiff > /out/test.tiff
