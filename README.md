
# EXK (X = fluentd or logstash)

- original elk project

        https://github.com/deviantony/docker-elk

- usage

        1. run (mac m1 ok)

                docker-compose up

                http://localhost:5601
                user: elastic
                password: changeme

        2. import log & create index pattern

                1. if fluentd

                        vi docker-compose.yaml
                        JF_PRODUCT_DATA_INTERNAL: "/Users/kyle/Downloads/efk-log/"
                
                2. if logstash
                
                        this way, column names are defined in ./pipeline/logstash.conf        
                        cat ./sample-logs/artifactory-request.log | nc -c localhost 5001

        3. create index pattern

                1. create index by import
                
                        stack management > saved object > import > select ./kibana/kibana_dashboard_v1.ndjson (will create index unified-artifactory)
                
                2. if create index directly
                
                        import log first, then you can choose the name for time field (default only can choose @timestamp)
                        ui > Discover > enter unified-artifactory (default is logstash-*) > next step > select time field e.g. timestamp (check the name from ./pipeline/logstash.conf) as time

                3. if by file upload

                        - bad
                        100M limited, no defined column name

                        - how
                        ui > home > upload a file > override settings > time field > select the column has date value e.g. column1 > click import > create (input if exists) index pattern name e.g. unified-artifactory

                        - about time field
                        if to use default timeline chart in Discover page 
                        change the column name to @timestamp

                        if to use index from the imported saved object
                        change the column name to timestamp, and change other column names ...
                
        4. start to use

                ui > Discover
                ui > Visualize

- todo

        1. make it ready to connect to live artifactory (on the same host) to have metric
        2. config another fluentd for xray logs ? 

        



