#!/bin/bash


# RUNTIME-CONFIG CHANGE
cd ${BOSH_DEPLOYMENT_PATH}/runtime-configs

echo 'releases:
- name: "os-conf"
  url:  "https://bosh.io/d/github.com/cloudfoundry/os-conf-release?v=22.1.0"
  sha1: "7ef05f6f3ebc03f59ad8131851dbd1abd1ab3663"
  version: "22.1.0"

addons:
- include:
    stemcell:
    - os: ubuntu-trusty
    - os: ubuntu-xenial
  name: os-configuration
  jobs:
  - name: sysctl
    release: os-conf
    properties:
      sysctl:
      - net.ipv4.tcp_timestamps=0' > os-conf.yml



# DNS NEWLINE_CONVERT CHECK
cd ${BOSH_DEPLOYMENT_PATH}/runtime-configs

echo "=======GREP DNS NEWLINE_CONVERT======="
grep "${DNS_NEWLINE_CONVERT}" dns.yml
echo "=======GREP DNS NEWLINE_CONVERT======="

# SLEEP!!!! AND ECHO CHECK
echo "NEWLINE_CONVERT CHECK!!!! IF HIT IT, END IT!!!!"
sleep 5

# DNS NEWLINE_CONVERT
cat dns.yml | tr "\n" "${DNS_NEWLINE_CONVERT}" >> temp-dns.yml


# DNS CONVERT
sed -i -e 's/include:+    stemcell:+    - os: ubuntu-trusty/include:+    deployments:+    - paasta+    - pinpoint+    - pinpoint-monitoring  +    stemcell:+    - os: ubuntu-trusty/g' temp-dns.yml


# DNS NEWLINE_RECONVERT
cat temp-dns.yml | tr "${DNS_NEWLINE_CONVERT}" "\n" >> new-dns.yml
cat temp-dns.yml | tr "+" "\n" >> new-dns.yml

# TEMP & BOSH DEPLOYMENT CHANGE
rm temp-dns.yml
rm dns.yml
mv new-dns.yml dns.yml

