FROM ubuntu:18.04
MAINTAINER Chris Quan

# Install.
RUN \
##  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update --fix-missing && \
  apt-get -y upgrade && \
  apt-get install -y build-essential && \
  apt-get install -y software-properties-common && \
  apt-get install -y curl git unzip vim wget && \
  rm -rf /var/lib/apt/lists/*

# Install nodejs 9 and npm 5
RUN \
  apt-get install -y curl && \
  curl -sL https://deb.nodesource.com/setup_9.x | bash - && \
  apt-get install -y nodejs 

# Install json-server
RUN npm install -g json-server &&\
  json-server -v

# Copy files
COPY ./json-server/json/db.json /json-server/json/db.json

# Change working directory
#WORKDIR json-server/

# Exposing port 3000 to the outside
EXPOSE 3000

# Start json-server on port 3000
#ENTRYPOINT ["json-server", "--watch", "json-server/json/db.json"]
CMD ["json-server", "--watch", "json-server/json/db.json"]
#CMD ["bash"]