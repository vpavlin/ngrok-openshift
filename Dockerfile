FROM centos:7 as builder

ENV GOROOT /usr/lib/golang
ENV GOPATH /opt/golang

RUN yum -y install golang git make
RUN echo $GOPATH $GOROOT

WORKDIR /opt/golang
RUN git clone https://github.com/inconshreveable/ngrok
RUN cd ngrok && make

FROM centos:7

WORKDIR /opt/ngrok
ENTRYPOINT ["./scripts/entrypoint.sh"]

COPY --from=builder /opt/golang/ngrok/bin/ngrok* /usr/local/bin/
COPY --from=builder /opt/golang/ngrok/assets  /opt/golang/ngrok/assets
COPY ngrok-config.yaml .
COPY scripts/ ./scripts/
RUN chmod +x scripts/*

