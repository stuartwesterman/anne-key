#!/bin/sh

set -eux

main() {
        rustup component list | grep 'thumbv7m.*installed' || \
            rustup target add thumbv7m-none-eabi

        rustup component list | grep 'rustfmt.*installed' || \
            rustup component add rustfmt-preview

        which cargo-bloat || (cd /; cargo install cargo-bloat)

        if [ ${TRAVIS_OS_NAME} != 'osx' ]; then
            mkdir gcc
            curl -L https://developer.arm.com/-/media/Files/downloads/gnu-rm/7-2018q2/gcc-arm-none-eabi-7-2018-q2-update-linux.tar.bz2?revision=bc2c96c0-14b5-4bb4-9f18-bceb4050fee7?product=GNU%20Arm%20Embedded%20Toolchain,64-bit,,Linux,7-2018-q2-update | tar --strip-components=1 -C gcc -xj
        fi
}

main
