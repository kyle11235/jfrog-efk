
- original project

        https://github.com/deviantony/docker-elk
        also check ./README-original.md

- usage

        1. run (mac m1 ok)

                docker-compose up

                http://localhost:5601
                user: elastic
                password: changeme

        2. import log, way1

                - way1, by file upload (100M limited, no defined column name)

                        1. import (important to set @timestamp column)

                                ui > home > upload a file > override settings > time field > select the column has date value e.g. column1 > change the column name to @timestamp
                                
                        2. create index pattern
                        
                                click import > input index pattern name e.g. upload-01

                - way2, by console

                        1. import 
                        
                                cat ./sample-logs/access-request.log | nc -c localhost 5001

                        2. create index pattern

                                ui > Discover > enter logstash-* > next step > select request.datelog as time

        3. start to use

                ui > Discover
                ui > Visualize
                ui > home > add data > sample > Sample web logs

                


