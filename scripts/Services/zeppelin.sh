DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. ${DIR}/../../ambari.properties

git clone https://github.com/hortonworks-gallery/ambari-zeppelin-service.git ${service_path}/ZEPPELIN   

