FROM ubuntu
MAINTAINER Gitai<i@gitai.me>

ENV ANDROID_HOME /root
ENV TOOLCHAIN $ANDROID_HOME/toolchain
ENV PATH $TOOLCHAIN/bin:$PATH

ENV NDK_VERSION r14b

# Install toolchain
WORKDIR /root
RUN apt-get update && \
    apt-get install -y unzip make binutils autoconf \
      automake autotools-dev libtool pkg-config git \
      curl dpkg-dev libxml2-dev genisoimage libc6-i386 \
      lib32stdc++6 python&& \
    rm -rf /var/cache/apk/*

RUN curl -L -O https://dl.google.com/android/repository/android-ndk-$NDK_VERSION-linux-x86_64.zip && \
    unzip -q android-ndk-$NDK_VERSION-linux-x86_64.zip && \
    rm android-ndk-$NDK_VERSION-linux-x86_64.zip && \
    mkdir -p $ANDROID_HOME/toolchain && \
    $ANDROID_HOME/android-ndk-$NDK_VERSION/build/tools/make-standalone-toolchain.sh \
        --install-dir=$ANDROID_HOME/toolchain \
        --toolchain=arm-linux-androideabi-4.9 \
        --force && \
    rm -r android-ndk-$NDK_VERSION

