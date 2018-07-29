# flex-sdk, jdk-alpine, ant, git

# Set the base image
FROM java:8u111-jdk-alpine
COPY flex_sdk_4.6 /flex/
COPY apache-ant-1.10.3 /ant/
ENV PATH="/flex/bin:/ant/bin:${PATH}"
RUN apk add --update git