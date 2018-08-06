# consul, nsq, mysql, redis, supervisor
# docker run -it --rm -p 3305:3306 -p 6378:6379 -p 8300:8300 -p 8301:8301 -p 8302:8302 -p 8500:8500 -p 8600:8600 -p 4150:4150 -p 4151:4151 -p 4160:4160 -p 4161:4161 -p 4170:4170 -p 4171:4171 --name nsq_boot_allinone nsq_boot:allinone
# Set the base image
FROM ubuntu:latest

LABEL Description="with supervisor"

RUN apt-get update && apt-get install supervisor -y
