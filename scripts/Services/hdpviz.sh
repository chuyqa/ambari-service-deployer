#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

git clone https://github.com/abajwa-hw/hdpviz.git 

#todo- Ensure service_path is defined
#cp -R hdpviz_stack ${services_path}

#IP=$(ifconfig eth0|awk '/inet addr/ {split ($2,A,":"); print A[2]}')
#sed -i "s/sandbox.hortonworks.com/$IP/g" ${DIR}/hdpviz-view/src/main/resources/index.html

#cd ${DIR}/hdpviz_stack 
#mvn clean package
#cp target/*.jar /var/lib/ambari-server/resources/views

sudo ambari-server restart
