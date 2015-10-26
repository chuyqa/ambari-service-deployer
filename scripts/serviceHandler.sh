#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd .. && pwd )"
. ${DIR}/ambari.properties
service_name=$(jq '.services[].name' ${DIR}/conf/service-mapping.json | grep $1 | cut -d'"' -f2)
echo ${service_name}
echo $1

if [ ! -z ${service_name} ] & [ "$1" = "$service_name" ];  then
  script_name=$(jq -c '.services[] | select(.name | contains ("'${service_name}'")) | .Properties[] | .Script' ${DIR}/conf/service-mapping.json | cut -d'"' -f2)
  . ${DIR}/scripts/Services/${script_name}
else
 echo ' service name not found'
fi
