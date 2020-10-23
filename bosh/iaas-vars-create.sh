#!/bin/bash

# VARS CREATE
echo '# BOSH VARIABLE
bosh_client_admin_id: "admin"		# Bosh Client Admin ID
private_cidr: "10.0.1.0/24"		# Private IP Range
private_gw: "10.0.1.1"			# Private IP Gateway
bosh_ip: "10.0.1.6"			# Private IP 	
inception_os_user_name: "ubuntu"	# Home User Name
director_name: "micro-bosh"		# BOSH Director Name
access_key_id: "XXXXXXXXXXXXXXX"	# AWS Access Key
secret_access_key: "XXXXXXXXXXXXX"	# AWS Secret Key
region: "ap-northeast-2"		# AWS Region
az: "ap-northeast-2a"			# AWS AZ Zone
default_key_name: "aws-paasta"	# AWS Key Name
default_security_groups: ["bosh"]	# AWS Security-Group
subnet_id: "paasta-subnet"		# AWS Subnet
private_key: "~/.ssh/aws-paasta.pem"	# SSH Private Key Path

# MONITORING VARIABLE(PaaS-TA Monitoring을 설치할 경우 수정)
metric_url: "10.0.161.101"		# PaaS-TA Monitoring InfluxDB IP
syslog_address: "10.0.121.100"		# Logsearch의 ls-router IP
syslog_port: "2514"			# Logsearch의 ls-router Port
syslog_transport: "relp"		# Logsearch Protocol' > aws-vars.yml

echo '# BOSH VARIABLE
bosh_client_admin_id: "admin"				# Bosh Client Admin ID
private_cidr: "10.0.1.0/24"				# Private IP Range
private_gw: "10.0.1.1"					# Private IP Gateway
bosh_ip: "10.0.1.6"					# Private IP
inception_os_user_name: "ubuntu"			# Home User Name
director_name: "micro-bosh"				# BOSH Director Name
vnet_name: "paasta-bosh-net"				# Azure VNet Name
subnet_name: "paasta-subnet"				# Azure VNet Subnet Name
subscription_id: "XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX"	# Azure Subscription ID
tenant_id: "XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX"	# Azure Tenant ID
client_id: "XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX"	# Azure Client ID
client_secret: "client-secret"				# Azure Client Secret
resource_group_name: "paasta-bosh-group"		# Azure Resource Group
storage_account_name: "paasta-store"			# Azure Storage Account
default_security_group: "paasta-security"		# Azure Security Group

# MONITORING VARIABLE(PaaS-TA Monitoring을 설치할 경우 수정)
metric_url: "10.0.161.101"				# PaaS-TA Monitoring InfluxDB IP
syslog_address: "10.0.121.100"				# Logsearch의 ls-router IP
syslog_port: "2514"					# Logsearch의 ls-router Port
syslog_transport: "relp"				# Logsearch Protocol' > azure-vars.yml


echo '# BOSH VARIABLE
bosh_client_admin_id: "admin"		# Bosh Client Admin ID
inception_os_user_name: "ubuntu"	# Home User Name
director_name: "micro-bosh"		# BOSH Director Name
private_cidr: "10.0.1.0/24"		# Private IP Range
private_gw: "10.0.1.1"			# Private IP Gateway
bosh_ip: "10.0.1.6"			# Private IP
network: "public-bosh"			# GCP Network Name
subnetwork: "public-bosh-subnet"	# GCP Subnet Name
tags: ["paasta-security"]		# GCP Tags
project_id: "paasta-project"		# GCP Project ID
zone: "asia-northeast1-a"		# GCP Zone

# MONITORING VARIABLE(PaaS-TA Monitoring을 설치할 경우 수정)
metric_url: "10.0.161.101"		# PaaS-TA Monitoring InfluxDB IP
syslog_address: "10.0.121.100"		# Logsearch의 ls-router IP
syslog_port: "2514"			# Logsearch의 ls-router Port
syslog_transport: "relp"		# Logsearch Protocol' > gcp-vars.yml

echo '# BOSH VARIABLE
bosh_client_admin_id: "admin"			# Bosh Client Admin ID
inception_os_user_name: "ubuntu"		# Home User Name
director_name: "micro-bosh"			# BOSH Director Name
private_cidr: "10.0.1.0/24"			# Private IP Range
private_gw: "10.0.1.1"				# Private IP Gateway
bosh_ip: "10.0.1.6"				# Private IP 
auth_url: "http://XX.XXX.XX.XX:XXXX/v3/"	# Openstack Keystone URL
az: "nova"					# Openstack AZ Zone
default_key_name: "paasta"			# Openstack Key Name
default_security_groups: ["paasta"]		# Openstack Security Group
net_id: "XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX"	# Openstack Network ID
openstack_password: "XXXXXX"			# Openstack User Password
openstack_username: "XXXXXX"			# Openstack User Name
openstack_domain: "XXXXXXX"			# Openstack Domain Name
openstack_project: "PaaSTA"			# Openstack Project
private_key: "~/.ssh/id_rsa.pem"		# Openstack Region
region: "RegionOne"				# SSH Private Key Path

# MONITORING VARIABLE(PaaS-TA Monitoring을 설치할 경우 수정)
metric_url: "10.0.161.101"			# PaaS-TA Monitoring InfluxDB IP
syslog_address: "10.0.121.100"			# Logsearch의 ls-router IP
syslog_port: "2514"				# Logsearch의 ls-router Port
syslog_transport: "relp"			# Logsearch Protocol' > openstack-vars.yml

echo '# BOSH VARIABLE
bosh_client_admin_id: "admin"			# Bosh Client Admin ID
inception_os_user_name: "ubuntu"		# Home User Name
director_name: "micro-bosh"			# BOSH Director Name
private_cidr: "10.0.1.0/24"			# Private IP Range
private_gw: "10.0.1.1"				# Private IP Gateway
bosh_ip: "10.0.1.6"				# Private IP 
network_name: "PaaS-TA"				# Private Network Name (vCenter)	
vcenter_dc: "PaaS-TA-DC"			# vCenter Data Center Name
vcenter_ds: "PaaS-TA-Storage"			# vCenter Data Storage Name
vcenter_ip: "XX.XX.XXX.XX"			# vCenter Private IP
vcenter_user: "XXXXX"				# vCenter User Name
vcenter_password: "XXXXXX"			# vCenter User Password
vcenter_templates: "PaaS-TA_Templates"		# vCenter Templates Name
vcenter_vms: "PaaS-TA_VMs"			# vCenter VMS Name
vcenter_disks: "PaaS-TA_Disks"			# vCenter Disk Name
vcenter_cluster: "PaaS-TA"			# vCenter Cluster Name
vcenter_rp: "PaaS-TA_Pool"			# vCenter Resource Pool Name

# MONITORING VARIABLE(PaaS-TA Monitoring을 설치할 경우 수정)
metric_url: "10.0.161.101"			# PaaS-TA Monitoring InfluxDB IP
syslog_address: "10.0.121.100"			# Logsearch의 ls-router IP
syslog_port: "2514"				# Logsearch의 ls-router Port
syslog_transport: "relp"			# Logsearch Protocol' > vsphere-vars.yml

echo '# BOSH VARIABLE
bosh_client_admin_id: "admin"		# Bosh Client Admin ID
inception_os_user_name: "ubuntu"	# Home User Name
director_name: "micro-bosh"		# BOSH Director Name
private_cidr: "10.0.1.0/24"		# Private IP Range
private_gw: "10.0.1.1"			# Private IP Gateway
bosh_ip: "10.0.1.6"			# Private IP 
outbound_network_name: "NatNetwork"	# Outbound Network Name' > bosh-lite-vars.yml



