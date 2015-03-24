#
# ElasticSearch Dockerfile
#
# https://github.com/dockerfile/elasticsearch
#

# Pull base image.
FROM dockerfile/java

# Install ElasticSearch.
RUN \
  cd /tmp && \
  wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.5.0.tar.gz && \
  tar xvzf elasticsearch-1.5.0.tar.gz && \
  rm -f elasticsearch-1.5.0.tar.gz && \
  mv /tmp/elasticsearch-1.5.0 /elasticsearch

# Install Kuromoji Plugin
#RUN /elasticsearch/bin/plugin -install elasticsearch/elasticsearch-analysis-kuromoji/2.5.0

# Install Marvel Plugin
RUN /elasticsearch/bin/plugin -i elasticsearch/marvel/latest

# Define mountable directories.
VOLUME ["/data"]

# Define working directory.
WORKDIR /data

# Define default command.
CMD ["/elasticsearch/bin/elasticsearch"]

# Expose ports.
#   - 9200: HTTP
#   - 9300: transport
EXPOSE 9200
EXPOSE 9300
