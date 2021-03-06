# flex-sdk, jdk-alpine, ant, git

FROM java:8u111-jdk-alpine
LABEL maintainer="Jue Chen<jchprj@gmail.com>"
LABEL Description="This image is based on JDK-alpine, include Adobe Flex SDK 4.6, Ant, Git"

ARG ANT_VER=1.10.9
ARG FLEX_VER=4.6

ADD http://download.macromedia.com/pub/flex/sdk/flex_sdk_$FLEX_VER.zip /flex/
ADD http://apache.mirrors.tds.net/ant/binaries/apache-ant-$ANT_VER-bin.zip /ant/

ENV PATH="/flex/bin:/ant/bin:${PATH}"

RUN \
    unzip /flex/flex_sdk_$FLEX_VER.zip -d /flex && \
    rm -f /flex/flex_sdk_$FLEX_VER.zip && \
    unzip /ant/apache-ant-$ANT_VER-bin.zip -d /ant && \
    rm -f /ant/apache-ant-$ANT_VER-bin.zip && \
    mv /ant/apache-ant-$ANT_VER/* /ant && \
    rmdir /ant/apache-ant-$ANT_VER && \
    rm /ant/manual -rf && \
    apk add --update git

ADD ecj-4.6.1.jar /ant/lib/
