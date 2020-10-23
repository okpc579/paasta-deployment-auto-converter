#!/bin/bash

# 공통 변수 변경
find . -type f | xargs sed -i -e 's/internal_cidr/private_cidr/g' 
find . -type f | xargs sed -i -e 's/internal_gw/private_gw/g' 
find . -type f | xargs sed -i -e 's/internal_ip/bosh_ip/g' 
find . -type f | xargs sed -i -e 's/external_ip/public_ip/g' 
