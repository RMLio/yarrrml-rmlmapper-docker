# YARRRML + RMLMapper

FROM openjdk:19-buster

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN curl -sL https://deb.nodesource.com/setup_18.x | bash -
RUN apt-get update -qq && apt-get install -qq --no-install-recommends \
  nodejs
	# change group id to group that has permissions to read input and write result!
RUN groupadd --system -g 1000 rmluser \
	# Change user id (-u) to user that has permissions to read input and write result!
	&& useradd --system -s /bin/bash -g rmluser -u 1000 rmluser --create-home

USER rmluser:rmluser
WORKDIR /home/rmluser

RUN curl -L https://github.com/RMLio/rmlmapper-java/releases/download/v6.0.0/rmlmapper-6.0.0-r363-all.jar > rmlmapper.jar \
	&& npm install @rmlio/yarrrml-parser \
	&& mkdir data

COPY map.sh /home/rmluser/map.sh

VOLUME ["/home/rmluser/data"]

ENTRYPOINT ["/home/rmluser/map.sh"]
