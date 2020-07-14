#!/bin/bash
REDIS_CLUSTER_IP=`docker network ls|grep 'redis-cluster'|awk '{print $1}'|xargs docker network inspect|grep Gateway|awk '{print $2}'|tr -d '"'`

# password less
# docker exec -it redis1 redis-cli -c -p 7001 --cluster create $REDIS_CLUSTER_IP:7001 $REDIS_CLUSTER_IP:7002 $REDIS_CLUSTER_IP:7003 $REDIS_CLUSTER_IP:7004 $REDIS_CLUSTER_IP:7005 $REDIS_CLUSTER_IP:7006 --cluster-replicas 1
docker exec -it redis1 sh -c "echo 'yes' | redis-cli -c -p 7001 --cluster create $REDIS_CLUSTER_IP:7001 $REDIS_CLUSTER_IP:7002 $REDIS_CLUSTER_IP:7003 $REDIS_CLUSTER_IP:7004 $REDIS_CLUSTER_IP:7005 $REDIS_CLUSTER_IP:7006 --cluster-replicas 1"

