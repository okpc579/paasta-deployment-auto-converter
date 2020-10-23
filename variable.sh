#!/bin/bash

# VARIABLES
CF_VERSION="13.22.0"
PAASTA_VERSION="6.0"
SHELL_SCRIPT_PATH="/home/ubuntu/workspace"       # (e.g. /home/ubuntu/paasta-6.0/deployment/paasta-deployment/cf-deployment)
BOSH_DEPLOYMENT_PATH="/home/ubuntu/paasta-6.0/deployment/paasta-deployment/bosh-deployment"       # (e.g. /home/ubuntu/paasta-6.0/deployment/paasta-deployment/bosh-deployment)
CLOUD_CONFIG_CREATE_FOLDER_PATH="/home/ubuntu/paasta-6.0/deployment/paasta-deployment"       # (e.g. /home/ubuntu/paasta-6.0/deployment/paasta-deployment)
CF_DEPLOYMENT_PATH="/home/ubuntu/paasta-6.0/deployment/paasta-deployment/cf-deployment"       # (e.g. /home/ubuntu/paasta-6.0/deployment/paasta-deployment/cf-deployment)
BOSH_NEWLINE_CONVERT="+"
DNS_NEWLINE_CONVERT="+"
CF_DEPLOYMENT_NEWLINE_CONVERT="+"
CF_HAPROXY_NEWLINE_CONVERT="@"
CF_RENAME_NEWLINE_CONVERT="+"
CF_STEMCELL=621.89

