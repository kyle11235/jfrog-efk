
docker-compose down -v

# solve issue that images not updated
docker rmi exk-elasticsearch
docker rmi exk-kibana
docker rmi exk-fluentd
docker rmi exk-logstash
