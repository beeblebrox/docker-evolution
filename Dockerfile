FROM ubuntu:15.10

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -qqy sudo evolution evolution-ews gnome-keyring && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

VOLUME ['/home/developer']

ENV uid=1000 gid=1000
# Replace 1000 with your user / group id
RUN mkdir -p /home/developer && \
    echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
    echo "developer:x:${uid}:" >> /etc/group && \
    echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
    chmod 0440 /etc/sudoers.d/developer && \
    chown ${uid}:${gid} -R /home/developer

USER developer
ENV HOME /home/developer
ENTRYPOINT ["/usr/bin/evolution"]

