# YARRRML + RMLMapper

FROM openjdk:8-jre-alpine

RUN apk --no-cache add python2 make g++ npm \
	# change group id to group that has permissions to read input and write result!
	&& addgroup -S -g 1000 rmluser \
	# Change user id (-u) to user that has permissions to read input and write result!
	&& adduser -S -s /bin/bash -G rmluser -u 1000 rmluser

USER rmluser:rmluser
WORKDIR /home/rmluser

RUN wget -O rmlmapper.jar https://github.com/RMLio/rmlmapper-java/releases/download/v4.3.3/rmlmapper-4.3.3-r92.jar \
	&& npm install @rmlio/yarrrml-parser \
	&& mkdir data

COPY map.sh /home/rmluser/map.sh

VOLUME ["/home/rmluser/data"]

ENTRYPOINT ["/home/rmluser/map.sh"]
