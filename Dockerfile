FROM ubuntu:22.04

#Install lastest geth from bitkub
RUN apt-get update && apt-get install curl -y
RUN curl -L https://bkc-storage.obs.ap-southeast-2.myhuaweicloud.com/geth/v2.1.0/geth-linux-amd64-go1-18-10 -o /usr/bin/geth
RUN chmod +x /usr/bin/geth

EXPOSE 8545 8546 30303 30303/udp
ENTRYPOINT ["geth"]