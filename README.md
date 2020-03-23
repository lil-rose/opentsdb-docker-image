# opentsdb-docker-image

docker run -d -p 4242:4242 \
	--name opentsdb-1 \
	--hostname opentsdb-1 \
	--network hdfs-net \
	lilrose/opentsdb:1.0