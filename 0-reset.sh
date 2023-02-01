
docker-compose down -v

# solve issue that images not updated
docker rmi docker-elk-elasticsearch
docker rmi docker-elk-kibana
docker rmi docker-elk-fluentd
docker rmi docker-elk-logstash
