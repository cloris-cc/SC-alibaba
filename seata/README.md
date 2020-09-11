##1.3 启动seata-server
分两步，如下

### 初始化seata 的nacos配置
```
sh ${SEATAPATH}/script/config-center/nacos/nacos-config.sh -h localhost -p 8848 -g SEATA_GROUP -t 5a3c7d6c-f497-4d68-a71a-2e5e3340b3ca -u username -w password
```
Parameter Description:

-h: host, the default value is localhost.

-p: port, the default value is 8848.

-g: Configure grouping, the default value is 'SEATA_GROUP'.

-t: Tenant information, corresponding to the namespace ID field of Nacos, the default value is ''.

-u: username, nacos 1.2.0+ on permission control, the default value is ''.

-w: password, nacos 1.2.0+ on permission control, the default value is ''.

### 启动seata-server
cd bin
sh seata-server.sh -p 8091 -m file