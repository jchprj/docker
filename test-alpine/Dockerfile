# alpine test
# docker run -it test-alpine sh -l dp

# Set the base image
FROM alpine
LABEL Description="alias can only be used in interactive sh -l"
COPY root/* /root/
RUN echo '\
        . /etc/profile ; \
    ' >> /root/.profile