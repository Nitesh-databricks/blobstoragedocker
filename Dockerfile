FROM ubuntu:20.04

USER root
RUN apt-get update && apt-get install --no-install-recommends -yq wget ca-certificates \
 && wget --no-check-certificate https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb \
 && dpkg -i packages-microsoft-prod.deb \
 && apt-get update && apt-get install -y libcurl3-gnutls blobfuse fuse \
 && apt-get remove -y wget \
 && apt-get clean -y \
 && apt-get autoremove -y \
 && rm -rf /var/lib/apt/lists/* 

COPY mount-setup.sh /
RUN chmod +x /mount-setup.sh
ENTRYPOINT ["/mount-setup.sh"]