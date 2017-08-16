FROM ubuntu
MAINTAINER Gitai<i@gitai.me>

ENV ANDROID_HOME /root
ENV TOOLCHAIN $ANDROID_HOME/toolchain
ENV PATH $TOOLCHAIN/bin:$PATH

ENV NDK_VERSION r14b

# Install toolchain
WORKDIR /root
RUN apt update && \
    apt install --quiet -y wget unzip && \
    rm -rf /var/cache/apk/*

RUN wget --quiet https://dl.google.com/android/repository/android-ndk-$NDK_VERSION-linux-x86_64.zip && \
    unzip -q android-ndk-$NDK_VERSION-linux-x86_64.zip && \
    rm android-ndk-$NDK_VERSION-linux-x86_64.zip

