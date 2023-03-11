
FROM fluentd:v1.14-1

# https://docs.fluentd.org/input/tail
# From Fluentd v1.14.3, in_tail reads newly added files from head automatically even if read_from_head is false
# FROM fluentd:v1.14.3-1.1
#  ... exists in dockerhub but not found error

# ARG & ENV all after FROM
ARG JF_PRODUCT_DATA_INTERNAL
ARG ELASTIC_HOST
ARG ELASTIC_PORT
ARG ELASTIC_USER
ARG ELASTIC_PASSWORD
ARG ELASTIC_SCHEME
ARG ELASTIC_SSL_VERIFY
ARG JF_JPD_URL
ARG JF_JPD_USER_NAME
ARG JF_JPD_API_KEY
ARG JF_JPD_TOKEN

ENV JF_PRODUCT_DATA_INTERNAL=$JF_PRODUCT_DATA_INTERNAL
ENV ELASTIC_HOST=$ELASTIC_HOST
ENV ELASTIC_PORT=$ELASTIC_PORT
ENV ELASTIC_USER=$ELASTIC_USER
ENV ELASTIC_PASSWORD=$ELASTIC_PASSWORD
ENV ELASTIC_SCHEME=$ELASTIC_SCHEME
ENV ELASTIC_SSL_VERIFY=$ELASTIC_SSL_VERIFY
ENV JF_JPD_URL=$JF_JPD_URL
ENV JF_JPD_USER_NAME=$JF_JPD_USER_NAME
ENV JF_JPD_API_KEY=$JF_JPD_API_KEY
ENV JF_JPD_TOKEN=$JF_JPD_TOKEN

# Use root account to use apk
USER root

# below RUN includes plugin as examples elasticsearch is not required# you may customize including plugins as you wish
RUN apk add --no-cache --update --virtual .build-deps \
        sudo build-base ruby-dev \
&& gem uninstall -I elasticsearch \
&& gem install elasticsearch -v 7.14.0 \
&& sudo gem install fluent-plugin-elasticsearch \
&& sudo gem install fluent-plugin-jfrog-siem \
&& sudo gem install fluent-plugin-jfrog-metrics \
&& sudo gem sources --clear-all \
&& apk del .build-deps \
&& rm -rf /tmp/* /var/tmp/* /usr/lib/ruby/gems/*/cache/*.gem

# copy fluentd configuration from host image
COPY ./config/fluent.conf.jfrog /fluentd/etc/

# copy binary start file
COPY entrypoint.sh /bin/

RUN chmod +x /bin/entrypoint.sh

USER fluent
