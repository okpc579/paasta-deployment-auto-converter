#!/bin/bash

# DEPLOY CREATE

echo '#!/bin/bash

bosh create-env bosh.yml \
	--state=aws/state.json \
	--vars-store=aws/creds.yml \
	-o aws/cpi.yml \
	-o uaa.yml \
	-o credhub.yml \
	-o jumpbox-user.yml \
	-l aws-vars.yml' > deploy-aws.sh

echo '#!/bin/bash

bosh create-env bosh.yml \
	--state=azure/state.json \
	--vars-store azure/creds.yml \
	-o azure/cpi.yml \
	-o uaa.yml  \
	-o credhub.yml  \
	-o jumpbox-user.yml  \
	-l azure-vars.yml' > deploy-azure.sh
	
echo '#!/bin/bash

bosh create-env bosh.yml \
	--state=gcp/state.json \
	--vars-store gcp/creds.yml \
	-o gcp/cpi.yml \
	-o uaa.yml  \
	-o credhub.yml  \
	-o jumpbox-user.yml  \
	--var-file gcp_credentials_json=~/.ssh/paasta-project.json \
	-l gcp-vars.yml' > deploy-gcp.sh
	
echo '#!/bin/bash

bosh create-env bosh.yml \
	--state=openstack/state.json \
	--vars-store=openstack/creds.yml \
	-o openstack/cpi.yml \
	-o uaa.yml \
	-o credhub.yml \
	-o jumpbox-user.yml \
	-o openstack/disable-readable-vm-names.yml \
	-l openstack-vars.yml' > deploy-openstack.sh
	
echo '#!/bin/bash

bosh create-env bosh.yml \
	--state=vsphere/state.json \
	--vars-store=vsphere/creds.yml \
	-o vsphere/cpi.yml \
	-o vsphere/resource-pool.yml  \
	-o uaa.yml  \
	-o credhub.yml  \
	-o jumpbox-user.yml  \
	-l vsphere-vars.yml' > deploy-vsphere.sh

echo '#!/bin/bash

bosh create-env bosh.yml \
	--state=bosh-lite/state.json \
	--vars-store bosh-lite/creds.yml \
	-o virtualbox/cpi.yml \
	-o virtualbox/outbound-network.yml \
	-o bosh-lite.yml \
	-o uaa.yml \
	-o credhub.yml \
	-o jumpbox-user.yml \
	-l bosh-lite-vars.yml' > deploy-bosh-lite.sh


