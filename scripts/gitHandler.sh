#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd .. && pwd )"
. ${DIR}/ambari.properties

mkdir -p ${DIR}/newService && cd ${DIR}/newService && wget $1 
sed -n '/<code/,/<\/code/p' ${DIR}/newService/README.md | sed -e 's/<[^>]*>//g' > ${DIR}/newService/installAllZeThings.sh

chmod 755  ${DIR}/newService/installAllZeThings.sh
.  ${DIR}/newService/installAllZeThings.sh
