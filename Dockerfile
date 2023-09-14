FROM ubuntu:latest

# Install dependencies
RUN apt-get update && apt-get install -y  \
   binutils-mingw-w64     binutils-mingw-w64-i686     binutils-mingw-w64-x86-64     build-essential     clang     g++-mingw-w64     g++-mingw-w64-i686     g++-mingw-w64-x86-64     gcc-mingw-w64     gcc-mingw-w64-i686     gcc-mingw-w64-x86-64     git     git-email     gnutls-bin     libaio-dev     libbluetooth-dev     libbrlapi-dev     libbz2-dev     libcacard-dev     libcap-dev     libcap-ng-dev     libcurl4-gnutls-dev     libibverbs-dev     libiscsi-dev     libfdt-dev     libglib2.0-dev     libgtk-3-dev     libjpeg8-dev     liblzo2-dev     libncurses5-dev     libncursesw5-dev     libnfs-dev     libnuma-dev     libpam0g-dev     libpixman-1-dev     librbd-dev     librdmacm-dev     libsasl2-dev     libsdl1.2-dev     libsdl2-dev     libsdl2-image-dev     libseccomp-dev     libsnappy-dev     libssh2-1-dev     libusb-1.0-0-dev     libusb-dev     libvde-dev     libvdeplug-dev     libvirglrenderer-dev     libvte-2.91-dev     libxen-dev     libxml2-dev     libz-mingw-w64-dev     libzstd-dev     ninja-build     valgrind     win-iconv-mingw-w64-dev     xfslibs-dev     zlib1g-dev libspice-protocol-dev libspice-server-dev libusbredirparser-dev libusbredirparser1

RUN git clone https://gitlab.com/qemu-project/qemu.git -b v7.0.0 --depth 1 --recursive
RUN git clone https://github.com/zhaodice/qemu-anti-detection.git
RUN cd qemu && git apply ../qemu-anti-detection/qemu7.0.0.patch && cd .. && \
    mkdir qemu_build && cd qemu_build && \
    ../qemu/configure --target-list=x86_64-softmmu,x86_64-linux-user --prefix=/usr && \
    make -j$(nproc) && make install

ENTRYPOINT ["/bin/bash"]