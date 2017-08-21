FROM buildpack-deps:stretch-scm

WORKDIR /emsdk
COPY . /emsdk

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install cmake nodejs default-jre python2.7 git-core build-essential -y && \
    ./emsdk install --build=Release sdk-incoming-64bit binaryen-master-64bit && \
    ./emsdk activate --build=Release sdk-incoming-64bit binaryen-master-64bit && \
    apt-get -y --purge remove curl git-core cmake && \
    apt-get -y autoremove && apt-get clean && \
    rm -rf /var/lib/apt/lists/*
