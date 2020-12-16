FROM ubuntu:18.04
MAINTAINER Viet Nguyen "<mrholao09@gmail.com>"
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y unzip wget gnupg ca-certificates \
      --no-install-recommends && \
	  apt-get autoremove -y && \
	  rm -rf /var/lib/apt/lists/*
    

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF && \
    echo "deb https://download.mono-project.com/repo/ubuntu stable-bionic main" | tee /etc/apt/sources.list.d/mono-official-stable.list && \
    apt-get update && \
    apt-get install -y mono-complete && \
    apt-get autoremove -y && \
	  rm -rf /var/lib/apt/lists/*
 
    
RUN mkdir -p /NamekDisk && cd /NamekDisk && \
  wget https://github.com/yar229/WebDavMailRuCloud/releases/download/1.13.1.1/WebDAVCloudMailRu-1.13.1.1-dotNet48.zip && \
  unzip WebDAVCloudMailRu-1.13.1.1-dotNet48.zip && ls -l /NamekDisk
  
EXPOSE 8080

CMD ["mono", "/NamekDisk/wdmrc.exe --protocol=YadWeb --port=8080 --host=http://* "]

