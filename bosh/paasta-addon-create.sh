#!/bin/bash


# PAASTA-ADDON CREATE
cd ${BOSH_DEPLOYMENT_PATH}
mkdir paasta-addon
cd ${BOSH_DEPLOYMENT_PATH}/paasta-addon

echo '- type: replace
  path: /releases/-
  value:
    name: paasta-monitoring-agent
    version: 4.0
    url: http://45.248.73.44/index.php/s/Zj4SaX56SrzdTzx/download
    sha1: 2e66b93860d09d93b01d1eab87fa936d4c41f426

- type: replace
  path: /instance_groups/name=bosh/jobs/-
  value:
    name: metrics_agent
    release: paasta-monitoring-agent
    properties:
      metrics_agent:
        influxdb:
          url: ((metric_url)):8059
          database: bosh_metric_db
          measurement: bosh_metrics
          processMeasurement: bosh_process_metrics
        origin: micro-bosh' > paasta-monitoring-agent.yml


