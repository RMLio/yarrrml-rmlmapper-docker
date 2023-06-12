# YARRRML + RMLMapper

FROM openjdk:18-ea-11-alpine

# install everything needed
RUN apk add --no-cache bash nodejs npm wget maven git && cd / && \
    ########## YARRRML-parser ##########
    wget https://github.com/RMLio/yarrrml-parser/archive/refs/heads/master.zip && \
    unzip master.zip && rm master.zip && \
    mv /yarrrml-parser-master /yarrrml-parser && \
    cd /yarrrml-parser && \
    npm install && \
    ############# RMLMapper ############
    cd / && \
    wget https://github.com/RMLio/rmlmapper-java/archive/refs/heads/master.zip && \
    unzip master.zip && rm master.zip && \
    mv rmlmapper-java-master rmlmapper-java && \
    cd rmlmapper-java && \
    mvn -DskipTests clean package && \
    cd / && \
    mkdir /mnt/data

COPY map.sh /map.sh

VOLUME ["/mnt/data"]

ENTRYPOINT ["/map.sh"]
