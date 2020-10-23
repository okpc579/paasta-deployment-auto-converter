#!/bin/bash


# DEPLOY CREATE

echo '#!/bin/bash

bosh -e micro-bosh -d paasta -n deploy paasta-deployment.yml \
	-o operations/aws.yml \
	-o operations/use-haproxy.yml \
	-o operations/use-haproxy-public-network.yml \
	-o operations/use-postgres.yml \
	-o operations/rename-network-and-deployment.yml \
	-l aws-vars.yml \
	-l ../../common/common_vars.yml' > deploy-aws.sh
echo '#!/bin/bash

bosh -e micro-bosh -d paasta -n deploy paasta-deployment.yml \
	-o operations/azure.yml \
	-o operations/use-haproxy.yml \
	-o operations/use-haproxy-public-network.yml \
	-o operations/use-postgres.yml \
	-o operations/rename-network-and-deployment.yml \
	-l azure-vars.yml \
	-l ../../common/common_vars.yml' > deploy-azure.sh
echo '#!/bin/bash

bosh -e micro-bosh -d paasta deploy paasta-deployment.yml \
	-o operations/use-haproxy.yml \
	-o operations/use-haproxy-public-network.yml \
	-o operations/use-postgres.yml \
	-o operations/rename-network-and-deployment.yml \
	-l gcp-vars.yml \
	-l ../../common/common_vars.yml' > deploy-gcp.sh
echo '#!/bin/bash

bosh -e micro-bosh -d paasta -n deploy paasta-deployment.yml \
	-o operations/openstack.yml \
	-o operations/use-haproxy.yml \
	-o operations/use-haproxy-public-network.yml \
	-o operations/use-postgres.yml \
	-o operations/rename-network-and-deployment.yml \
	-l openstack-vars.yml \
	-l ../../common/common_vars.yml' > deploy-openstack.sh
echo '#!/bin/bash

bosh -e micro-bosh -d paasta -n deploy paasta-deployment.yml \
	-o operations/use-haproxy.yml \
	-o operations/use-haproxy-public-network-vsphere.yml \
	-o operations/use-postgres.yml \
	-o operations/rename-network-and-deployment.yml \
	-l vsphere-vars.yml \
	-l ../../common/common_vars.yml' > deploy-vsphere.sh
echo '#!/bin/bash

bosh -e micro-bosh -d paasta -n deploy paasta-deployment.yml \
	-o operations/bosh-lite.yml \
	-o operations/use-postgres.yml \
	-o operations/rename-network-and-deployment.yml \
	-l bosh-lite-vars.yml \
	-l ../../common_vars.yml' > deploy-bosh-lite.sh

