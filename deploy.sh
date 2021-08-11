#!/bin/bash
podman pod create --name elastic -p 9200:9200 -p 9300:9300 -p 5601:5601
podman run --pod elastic --name elasticsearch -d -e "discovery.type=single-node" docker.elastic.co/elasticsearch/elasticsearch:7.14.0
podman run --pod elastic --name kibana -d -e "ELASTICSEARCH_HOSTS=http://127.0.0.1:9200" docker.elastic.co/kibana/kibana:7.14.0
