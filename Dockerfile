FROM amd64/mono:latest
MAINTAINER Viet Nguyen "<mrholao09@gmail.com>"
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y unzip wget gnupg ca-certificates \
      --no-install-recommends && \
	  apt-get autoremove -y && \
	  rm -rf /var/lib/apt/lists/*

RUN mkdir -p /NamekDisk && cd /NamekDisk && \
  wget https://github.com/yar229/WebDavMailRuCloud/releases/download/1.13.1.1/WebDAVCloudMailRu-1.13.1.1-dotNet5.zip && \
  unzip WebDAVCloudMailRu-1.13.1.1-dotNet5.zip && ls -l /NamekDisk
  
EXPOSE 8080
WORKDIR /NamekDisk

CMD [ "mono",  "/NamekDisk/wdmrc.exe --protocol=YadWeb --port=8080 --host=http://* "]

