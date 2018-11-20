FROM ubuntu:18.04
MAINTAINER Chris Quan

# Install nodejs 9 and npm 5
RUN apt-get update --fix-missing /
  && apt-get install -y build-essential /
  && apt-get install -y curl /
  && curl -sL https://deb.nodesource.com/setup_9.x | bash - /
  && apt-get install -y nodejs /

# Install json-server
RUN npm install -g json-server /
  && json-server -v

# Copy files
COPY ./json-server /json-server

# Change working directory
WORKDIR json-server/

# Exposing port 3000 to the outside
EXPOSE 3000

# Start json-server on port 3000
CMD ["json-server", "--watch", "json\db.json", "-p", "3000"]