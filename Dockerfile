FROM ubuntu
MAINTAINER Gitai<i@gitai.me>

ENV ANDROID_HOME /root
ENV TOOLCHAIN $ANDROID_HOME/toolchain
ENV PATH $TOOLCHAIN/bin:$PATH

ENV NDK_VERSION r17-beta2

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
    rm android-ndk-$NDK_VERSION-linux-x86_64.zip
