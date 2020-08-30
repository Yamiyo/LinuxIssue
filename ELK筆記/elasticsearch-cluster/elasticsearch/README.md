# create three VM in NAT with ip ...
創造es cluster時，需要在定義一些參數。以下例子以三個master nodes為例

- host1: 10.140.0.216
- host2: 10.140.0.217
- host3: 10.140.0.218


```yaml (elasticsearch.yml)
...

# 服務發現
discovery.seed_hosts: 
- 10.140.0.216
- 10.140.0.217
- 10.140.0.218

cluster.initial_master_nodes: 
- Elasticsearch_M1
- Elasticsearch_M2
- Elasticsearch_M3

...
```

# refer:
### config es cluster
- https://www.elastic.co/guide/en/elasticsearch/reference/current/modules-discovery-bootstrap-cluster.html

### introduction for elasticsearch and simple query syntax
- https://buildingvts.com/elasticsearch-architectural-overview-a35d3910e515

