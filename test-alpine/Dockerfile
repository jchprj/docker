# alpine test
# docker run -it test-alpine sh -l dp

# Set the base image
FROM alpine

LABEL Description="entrypoint test"
COPY root/* /root/

ENTRYPOINT [ "/root/entrypoint.sh" ]