#!/bin/bash
echo "构建镜像 ..."
mvn clean package -X -U -Dmaven.test.skip=true

docker build -t registry.cn-beijing.aliyuncs.com/hummerrisk/hummer-job:v1.0 .
docker push registry.cn-beijing.aliyuncs.com/hummerrisk/hummer-job:v1.0
docker images|grep hummer-job|awk '{print "docker rmi -f "$3}'|sh
