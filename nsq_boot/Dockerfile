# nsq_boot
# Set the base image
FROM nsqio/nsq
# Update application repository list and install the Redis server. 
# RUN 
# Expose default port
EXPOSE 4160
CMD /usr/local/bin/nsqd --lookupd-tcp-address=127.0.0.1:4160
# CMD ls /usr/local/bin
# Set the default command
# ENTRYPOINT ["/usr/bin/redis-server"]