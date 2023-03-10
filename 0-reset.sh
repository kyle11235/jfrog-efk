
docker-compose down -v

# solve issue that images not updated
docker rmi jfrog-efk-elasticsearch
docker rmi jfrog-efk-kibana
docker rmi jfrog-efk-fluentd
docker rmi jfrog-efk-logstash
