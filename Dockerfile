FROM ubuntu:20.04

RUN apt-get update -y && \
    apt-get install -y curl httpie procps netcat-traditional postgresql-client-12

ENV DEBIAN_FRONTEND=noninteractive
RUN ln -fs /usr/share/zoneinfo/Europe/Tallinn /etc/localtime && \
    apt-get install -y tzdata && \
    apt-get install -y dnsutils awscli

RUN apt-get install -y less vim && \
    rm -rf /var/lib/apt/lists/*

RUN echo 'alias die="http POST http://127.0.0.1:15000/quitquitquit ; exit"' >> ~/.bashrc
RUN echo 'alias exit="http POST http://127.0.0.1:15000/quitquitquit ; exit"' >> ~/.bashrc
