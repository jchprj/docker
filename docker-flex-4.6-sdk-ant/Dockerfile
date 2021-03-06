# flex-sdk, jdk-alpine, ant, git

FROM java:8u111-jdk-alpine
LABEL maintainer="Jue Chen<jchprj@gmail.com>"
LABEL Description="This image is based on JDK-alpine, include Adobe Flex SDK 4.6, Ant, Git"

ADD http://download.macromedia.com/pub/flex/sdk/flex_sdk_4.6.zip /flex/
ADD http://apache.mirrors.tds.net/ant/binaries/apache-ant-1.10.9-bin.zip /ant/

ENV PATH="/flex/bin:/ant/bin:${PATH}"

RUN \
    unzip /flex/flex_sdk_4.6.zip -d /flex && \
    rm -f /flex/flex_sdk_4.6.zip && \
    unzip /ant/apache-ant-1.10.5-bin.zip -d /ant && \
    rm -f /ant/apache-ant-1.10.5-bin.zip && \
    mv /ant/apache-ant-1.10.5/* /ant && \
    rmdir /ant/apache-ant-1.10.5 && \
    rm /ant/manual -rf && \
    apk add --update git

ADD ecj-4.6.1.jar /ant/lib/
