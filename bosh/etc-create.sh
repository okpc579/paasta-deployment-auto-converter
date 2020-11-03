#!/bin/bash

# UPDATE-RUNTIME-CONFIG CREATE
cd ${BOSH_DEPLOYMENT_PATH}

echo '#!/bin/bash

director_name="micro-bosh"

bosh -e ${director_name} update-runtime-config -n runtime-configs/dns.yml
bosh -e ${director_name} update-runtime-config -n --name=os-conf runtime-configs/os-conf.yml' > update-runtime-config.sh


echo '#!/bin/bash
BOSH_Director_Name="micro-bosh"
IaaS="aws"
STEMCELL_VERSION='${CF_STEMCELL}'


if [[ ${IaaS} = "aws" ]]; then
        bosh -e ${BOSH_Director_Name} upload-stemcell https://s3.amazonaws.com/bosh-core-stemcells/${STEMCELL_VERSION}/bosh-stemcell-${STEMCELL_VERSION}-aws-xen-hvm-ubuntu-xenial-go_agent.tgz -n
elif [[ ${IaaS} = "azure" ]]; then
        bosh -e ${BOSH_Director_Name} upload-stemcell https://bosh-core-stemcells.s3-accelerate.amazonaws.com/${STEMCELL_VERSION}/bosh-stemcell-${STEMCELL_VERSION}-azure-hyperv-ubuntu-xenial-go_agent.tgz -n
elif [[ ${IaaS} = "gcp" ]]; then
        bosh -e ${BOSH_Director_Name} upload-stemcell https://bosh-core-stemcells.s3-accelerate.amazonaws.com/${STEMCELL_VERSION}/bosh-stemcell-${STEMCELL_VERSION}-google-kvm-ubuntu-xenial-go_agent.tgz -n
elif [[ ${IaaS} = "openstack" ]]; then
        bosh -e ${BOSH_Director_Name} upload-stemcell https://s3.amazonaws.com/bosh-core-stemcells/${STEMCELL_VERSION}/bosh-stemcell-${STEMCELL_VERSION}-openstack-kvm-ubuntu-xenial-go_agent.tgz -n
elif [[ ${IaaS} = "vsphere" ]]; then
        bosh -e ${BOSH_Director_Name} upload-stemcell https://s3.amazonaws.com/bosh-core-stemcells/${STEMCELL_VERSION}/bosh-stemcell-${STEMCELL_VERSION}-vsphere-esxi-ubuntu-xenial-go_agent.tgz -n
else
        bosh -e ${BOSH_Director_Name} upload-stemcell https://s3.amazonaws.com/bosh-core-stemcells/${STEMCELL_VERSION}/bosh-stemcell-${STEMCELL_VERSION}-warden-boshlite-ubuntu-xenial-go_agent.tgz -n
fi' > upload-stemcell.sh

