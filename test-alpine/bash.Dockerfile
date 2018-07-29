# alpine test
# docker run -it test-alpine bash

# Set the base image
FROM alpine
LABEL Description="alias can only be used in interactive bash"
COPY root/* /root/
RUN apk add bash && echo '\
        . /etc/profile ; \
        PS1='\''\[\e[01;33m\][\h \u:\[\e[01;34m\]\w\[\e[01;33m\]]\[\e[00m\]\$ '\'' ; \
        eval `dircolors -b` ; \
        alias ls="ls --color=auto" ; \
        alias l="ls -lah" ; \
        alias ll="ls -lh" ; \
    ' >> /etc/bash.bashrc && \
    echo '. ~/.bashrc' > /root/.bash_profile && \
    echo '. /etc/bash.bashrc' > /root/.bashrc

CMD ["bash"]