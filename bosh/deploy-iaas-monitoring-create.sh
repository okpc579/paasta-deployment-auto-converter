#!/bin/bash

# DEPLOY-MONITORING CREATE

echo '#!/bin/bash

bosh create-env bosh.yml \
	--state=aws/state.json \
	--vars-store=aws/creds.yml \
	-o aws/cpi.yml \
	-o uaa.yml \
	-o credhub.yml \
	-o jumpbox-user.yml \
	-o syslog.yml \
	-o paasta-addon/paasta-monitoring-agent.yml \
	-l aws-vars.yml' > deploy-aws-monitoring.sh

echo '#!/bin/bash

bosh create-env bosh.yml \
	--state=azure/state.json \
	--vars-store azure/creds.yml \
	-o azure/cpi.yml \
	-o uaa.yml  \
	-o credhub.yml  \
	-o jumpbox-user.yml  \
	-o syslog.yml \
	-o paasta-addon/paasta-monitoring-agent.yml \
	-l azure-vars.yml' > deploy-azure-monitoring.sh
	
echo '#!/bin/bash

bosh create-env bosh.yml \
	--state=gcp/state.json \
	--vars-store gcp/creds.yml \
	-o gcp/cpi.yml \
	-o uaa.yml  \
	-o credhub.yml  \
	-o jumpbox-user.yml  \
	-o syslog.yml \
	-o paasta-addon/paasta-monitoring-agent.yml \
	--var-file gcp_credentials_json=~/.ssh/paasta-project.json \
	-l gcp-vars.yml' > deploy-gcp-monitoring.sh
	
echo '#!/bin/bash

bosh create-env bosh.yml \
	--state=openstack/state.json \
	--vars-store=openstack/creds.yml \
	-o openstack/cpi.yml \
	-o uaa.yml \
	-o credhub.yml \
	-o jumpbox-user.yml \
	-o openstack/disable-readable-vm-names.yml \
	-o syslog.yml \
	-o paasta-addon/paasta-monitoring-agent.yml \
	-l openstack-vars.yml' > deploy-openstack-monitoring.sh
	
echo '#!/bin/bash

bosh create-env bosh.yml \
	--state=vsphere/state.json \
	--vars-store=vsphere/creds.yml \
	-o vsphere/cpi.yml \
	-o vsphere/resource-pool.yml  \
	-o uaa.yml  \
	-o credhub.yml  \
	-o jumpbox-user.yml  \
	-o syslog.yml \
	-o paasta-addon/paasta-monitoring-agent.yml \
	-l vsphere-vars.yml' > deploy-vsphere-monitoring.sh


