# intro
mongodb 是目前市佔率數一數二的nosql資料庫，此例主要在練習一些mongodb常用的語法

### quick start
- 快速搭建起mongodb的環境
> docker-compsoe up -d

- 進入mongodb內操作
> docker exec -it mongo mongo -u root -p example

- dump data
> mongodump -d ${your_database} -o ./${dumped_data}

- restore data
> mongorestore -d ${your_database} ./${dumped_data}

### cluster infra
mongodb cluster
```UML
mongo1(primary)   mongo2(Secondary)   mongo3(Secondary)
      |		        			| 					        |
127.0.0.1:3001    127.0.0.1:3002      127.0.0.1:3003
```
- 建立流程
1. `docker-compose up -d` :啟動多個mongodb server
2. `docker exec -it mongo1 mongo -u root -p secret` :登入mongo互動介面
3. 檢查 mongodb 的叢集狀態
```bash
db = (new Mongo('localhost:27017')).getDB('test')
db.isMaster()
```
```log
{
        "ismaster" : true,
        "maxBsonObjectSize" : 16777216,
        "maxMessageSizeBytes" : 48000000,
        "maxWriteBatchSize" : 100000,
        "localTime" : ISODate("2020-04-30T03:43:35.343Z"),
        "logicalSessionTimeoutMinutes" : 30,
        "connectionId" : 2,
        "minWireVersion" : 0,
        "maxWireVersion" : 8,
        "readOnly" : false,
        "ok" : 1
}
```
4. 綁定叢集
```bash
config = { "_id" : "my-mongo-set", "members" : [{"_id" : 0, "host" : "mongo1:27017" }, { "_id" : 1, "host" : "mongo2:27017" }, { "_id" : 2, "host" : "mongo3:27017" }]}
rs.initiate(config)
```


# refer:
docker run mongodb
- https://pjchender.github.io/2018/12/09/mongo-mongodb-%E6%93%8D%E4%BD%9C/

backup & restore
- http://mongodbcanred.blogspot.com/2015/01/mongodbmongodump-mongorestore.html

mongo express
- https://github.com/mongo-express/mongo-express

setup mongodb cluster
- https://ithelp.ithome.com.tw/articles/10187117
- https://reurl.cc/E7jna1

rs.initiate(configuration)
- https://docs.mongodb.com/manual/reference/method/rs.initiate/#rs.initiate

Enable Access Control
- https://docs.mongodb.com/manual/tutorial/enable-authentication/

configuration
- https://docs.mongodb.com/manual/reference/replica-configuration/#replica-set-configuration-document
- https://docs.mongodb.com/manual/reference/command/replSetInitiate/
```js
{
  _id: <string>,
  version: <int>,
  protocolVersion: <number>,
  writeConcernMajorityJournalDefault: <boolean>,
  configsvr: <boolean>,
  members: [
    {
      _id: <int>,
      host: <string>,
      arbiterOnly: <boolean>,
      buildIndexes: <boolean>,
      hidden: <boolean>,
      priority: <number>,
      tags: <document>,
      slaveDelay: <int>,
      votes: <number>
    },
    ...
  ],
  settings: {
    chainingAllowed : <boolean>,
    heartbeatIntervalMillis : <int>,
    heartbeatTimeoutSecs: <int>,
    electionTimeoutMillis : <int>,
    catchUpTimeoutMillis : <int>,
    getLastErrorModes : <document>,
    getLastErrorDefaults : <document>,
    replicaSetId: <ObjectId>
  }
}
```

