# intro

fix version of elk with all 7.2.1 version

use `docker-compose up -d ` to have a quick start and 

cli ... `curl -XPOST http://127.0.0.1:4151/pub?topic=TopicName -d '{"msgkey": "msgValue"}'`

to send msg to message queue(hereby nsq)

to check whether data flow into elastisearch

# quick start
1. docker-compose up -d
2. curl -XPOST http://127.0.0.1:4151/pub?topic=TopicName -d '{"msgkey": "msgValue"}'
3. curl localhsot:9200/