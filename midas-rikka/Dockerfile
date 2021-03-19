FROM alpine:3.13.2

RUN apk add sudo
RUN addgroup -S backup \ 
    && adduser -S backup -G backup \
    && echo "backup ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers \
    && echo "backup:test" | chpasswd
USER backup

RUN sudo mkdir /mnt/nas \
    && sudo chown backup:backup /mnt/nas

RUN sudo apk add mariadb-client
