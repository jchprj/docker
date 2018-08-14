# Set the base image
FROM ubuntu:latest

LABEL Description="preinstall supervisor and some net tools"

RUN apt-get update && apt-get install supervisor curl net-tools iputils-ping telnet -y
