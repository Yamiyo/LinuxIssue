# intro
api是作為restful最常見的一個名詞，其中不錯的api client諸如`postman`尤其是企業愛用

但是一個`企業版`的postname要價是`24$(方案)+30$(每人)*5(至少5人)`

且postman的workspace還無法一次性dump，導致不易控管各個API的版本


# solution
- insomnia:
```
- https://github.com/Kong/insomnia/releases/v7.1.1
(linux) wget https://github.com/Kong/insomnia/releases/download/v7.1.1/insomnia-7.1.1.tar.gz
(mac) wget https://github.com/Kong/insomnia/releases/download/v7.1.1/Insomnia-7.1.1-mac.zip
```
- swaggymnia:
```
(linux) wget https://s3.amazonaws.com/swaggymnia/1.0.0-beta/linux/swaggymnia
(mac) wget https://s3.amazonaws.com/swaggymnia/1.0.0-beta/osx/swaggymnia
```

# quick start
1. 生產swagger.json
mac
> ./swaggymnia_mac generate -i ./watchnow.json -c ./config.json -o json

linux
> ./swaggymnia_linux generate -i ./watchnow.json -c ./config.json -o json


2. 啟動swagger-ui
> docker-compose up -d


3. 開啟網頁`http://127.0.0.1:8080/`，選擇`./swaggymnia/watchnow.json`來顯示對應的swagger-ui
![image](https://github.com/jim0409/LinuxIssue/blob/master/convert_insomnia_swagger/demo.png)


# refer:
tutorial for deploy insomnia to swagger server
- https://hackernoon.com/generate-beautiful-swagger-api-documentation-from-insomnia-ffaa2b77828e


github source code for swaggymnia
- https://github.com/mlabouardy/swaggymnia

