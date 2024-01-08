FROM alpine

RUN apk add bash
RUN apk add openssl
RUN mkdir /var/secrets

WORKDIR /root
ADD passodo.sh ./

VOLUME [ "/var/secrets" ]

WORKDIR /var/secrets

ENTRYPOINT [ "/root/passodo.sh" ]