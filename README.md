
- original project

        https://github.com/deviantony/docker-elk
        also check ./README-original.md

- usage

        1. run (mac m1 ok)

                docker-compose up

                http://localhost:5601
                user: elastic
                password: changeme

        2. import log & create index pattern

                1. import by console to tcp 
                
                        - good
                        this way, column names are defined in ./pipeline/logstash.conf        

                        - how
                        cat ./sample-logs/artifactory-request.log | nc -c localhost 5001

                2. create index by import
                
                        stack management > saved object > import > select ./kibana/export.ndjson (will create index unified-artifactory)
                
                3. if create index directly
                
                        import log first, then you can choose the name for time field (default only can choose @timestamp)
                        ui > Discover > enter unified-artifactory (default is logstash-*) > next step > select time field e.g. timestamp (check the name from ./pipeline/logstash.conf) as time

                4. if by file upload (import log & create index)

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
                ui > home > add data > sample > Sample web logs

                


