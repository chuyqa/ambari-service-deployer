#!/bin/bash

# Load Ambari.properties
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. ${DIR}/../ambari.properties


# Get the current stack PATH
response=$(curl -u admin:admin -i -H 'X-Requested-By: ambari' -X GET ${ambari_host}:${ambari_port}/api/v1/clusters/ | grep 'cluster_name')
cluster=$(echo $response | cut -d':' -f2)
response=$(curl -u admin:admin -i -H 'X-Requested-By: ambari' -X GET ${ambari_host}:${ambari_port}/api/v1/clusters/ | grep 'version')
stack=$(echo $response | cut -d':' -f2 | cut -d'-' -f1 | cut -d'"' -f2)
stackversion=$(echo $response | cut -d':' -f2 | cut -d'-' -f2 | cut -d'"' -f1)
servicepath=/var/lib/ambari-server/resources/stacks/${stack}/${stackversion}/services
echo service_path=${servicepath} >> ../ambari.properties

