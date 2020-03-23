
FROM debian
#alpine:
# RUN apk add openssh openssl bash dpkg curl rsync procps nss libc6

#Debian:
# RUN apt-get install openssh openssl curl rsync procps nss
RUN apt-get update && apt-get install -y \
    curl
RUN apt install bash dpkg libc6
# openssh openssl curl rsync procps nss

# Installing OpenTSDB
RUN curl -o /tmp/opentsdb-2.4.0_all.deb -L https://github.com/OpenTSDB/opentsdb/releases/download/v2.4.0/opentsdb-2.4.0_all.deb

RUN dpkg -i /tmp/opentsdb-2.4.0_all.deb

# Adding configuration files
COPY opentsdb.conf /etc/opentsdb

EXPOSE 4242
CMD ["service", "opentsdb", "start"]