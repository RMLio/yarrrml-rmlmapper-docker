# YARRRML + RMLMapper

FROM openjdk:18-ea-11-alpine

# install everything needed
RUN apk add --no-cache bash nodejs npm wget maven && cd / && \
    ########## YARRRML-parser ##########
    wget https://github.com/RMLio/yarrrml-parser/archive/refs/heads/development.zip && \
    unzip development.zip && rm development.zip && \
    cd /yarrrml-parser-development && \
    npm install && \
    ############# RMLMapper ############
    cd / && \
    wget https://github.com/RMLio/rmlmapper-java/archive/refs/heads/development.zip && \
    unzip development.zip && rm development.zip && \
    cd rmlmapper-java-development && \
    mvn -DskipTests -P no-buildnumber clean package && \
    cd / && \
    mkdir /mnt/data

COPY map.sh /map.sh

VOLUME ["/mnt/data"]

ENTRYPOINT ["/map.sh"]
