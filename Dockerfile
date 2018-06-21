FROM golang:1.10.2 as base-builder

WORKDIR /root/

RUN git clone https://github.com/Cibifang/go-rtc-server.git

WORKDIR /root/go-rtc-server

RUN ./configure

WORKDIR /root/

RUN git clone https://github.com/Cibifang/videoroom.git

WORKDIR /root/go-rtc-server/src/

RUN git clone https://github.com/Cibifang/janus.git

WORKDIR /root/go-rtc-server/

RUN ./bin/slpcompile videoroom /root/videoroom

FROM ubuntu:18.04

COPY --from=0 /usr/local/gortc /usr/local/gortc

COPY conf/*.ini /usr/local/gortc/conf/

ENTRYPOINT [ "/usr/local/gortc/bin/gortc" ]
