# Set the base image
FROM ubuntu
# Update application repository list and install the Redis server. 
RUN apt-get update && apt-get install -y redis-server
# Expose default port
EXPOSE 6379
CMD "--protected-mode no"
# Set the default command
ENTRYPOINT ["/usr/bin/redis-server"]