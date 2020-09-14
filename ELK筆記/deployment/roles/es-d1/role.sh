#!/bin/bash

# [DEBUG] cat ./config/ins_es.sh
# [DEBUG] cat ./config/jvm.options

echo "deploy es-master1 to $ES_D1"
# [DEBUG] cat ./config/elasticsearch_D1.yml
scp -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null ./config/ins_es.sh $ES_D1:/tmp
ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null $ES_D1 bash /tmp/ins_es.sh

# replace elasticsearch yml
scp -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null ./config/elasticsearch_D1.yml $ES_D1:/tmp
ssh -t -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null $ES_D1 "sudo rm -rf /etc/elasticsearch/elasticsearch.yml"
ssh -t -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null $ES_D1 "sudo mv /tmp/elasticsearch_D1.yml /etc/elasticsearch/elasticsearch.yml"

# replace jvm.options
scp -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null ./config/jvm.options $ES_D1:/tmp
ssh -t -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null $ES_D1 "sudo rm -rf /etc/elasticsearch/jvm.options"
ssh -t -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null $ES_D1 "sudo mv /tmp/jvm.options /etc/elasticsearch/jvm.options"

# start elasticsearch
ssh -t -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null $ES_D1 "sudo systemctl start elasticsearch"