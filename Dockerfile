
FROM debian
#alpine:
# RUN apk add openssh openssl bash dpkg curl rsync procps nss libc6

ENV CONFIG /etc/opentsdb/opentsdb.conf

#Debian:
# RUN apt-get install openssh openssl curl rsync procps nss default-jdk
RUN apt-get update && apt-get install -y \
    openjdk-11-jdk \
    gnuplot \
    curl \
    bash \
    dpkg \ 
    libc6

# RUN apt install bash dpkg libc6
# openssh openssl curl rsync procps nss

# Installing OpenTSDB
RUN curl -o /tmp/opentsdb-2.4.0_all.deb -L https://github.com/OpenTSDB/opentsdb/releases/download/v2.4.0/opentsdb-2.4.0_all.deb

RUN dpkg -i /tmp/opentsdb-2.4.0_all.deb

# Adding configuration files
COPY opentsdb.conf /etc/opentsdb

# ENV       JAVA_OPTS="-Xms512m -Xmx2048m"
# ENV       ZKQUORUM zookeeper:2181
# ENV       ZKBASEDIR /hbase
# ENV       TSDB_OPTS "--read-only --disable-ui"
# ENV       TSDB_PORT  4244

EXPOSE 4242
# CMD ["/usr/share/opentsdb/bin/tsdb", "tsd", "--"]
#  --staticroot=${STATICROOT} --cachedir=${CACHEDIR} --port=${TSDB_PORT} --zkquorum=${ZKQUORUM} --zkbasedir=${ZKBASEDIR} ${TSDB_OPTS}
ENTRYPOINT /usr/share/opentsdb/bin/tsdb tsd --config=${CONFIG}