#!/bin/bash

###################### 자동화 관련 가이드 ######################
### 생성일 : 20201022
### 생성자 : 남동윤
### 1차 수정일 : 20201022
### 1차 수정자 : 남동윤

# 1. VARIABLES의 변경이 필요함(현재 배포될 PaaS-TA의 버전과 변경될 CF의 버전 등)

# 2. 공통 변경 변수
# 2-1. BOSH-DEPLOYMENT
# 2-1-1. internal_cidr -> private_cidr
# 2-1-2. internal_gw -> private_gw
# 2-1-3. internal_ip -> bosh_ip
# 2-1-4. external_ip -> public_ip
# 2-2. CF-DEPLOYMENT
# 2-2-1. cf_admin_password -> paasta_admin_password
# 2-2-2. cc_database_password -> paasta_cc_db_password
# 2-2-3. uaa_database_password -> paasta_uaa_db_password
# 2-2-4. uaa_admin_client_secret -> uaa_client_admin_secret

# 3. 주요 변경 파일
# 3-1. BOSH-DEPLOYMENT
# 3-1-1. bosh.yml (admin -> ((bosh_client_admin_id)), 공통 변경 변수)
# 3-1-2. uaa.yml (internal_ip -> bosh_ip)
# 3-1-3. credhub.yml (internal_ip -> bosh_ip)
# 3-1-4. {IaaS}/cpi.yml (internal_ip -> bosh_ip)
# 3-1-5. external-ip-not-recommended.yml (external_ip -> public_ip)
# 3-1-6. external-ip-with-registry-not-recommended.yml (external_ip -> public_ip)
# 3-1-7. external-ip-not-recommended-uaa.yml (external_ip -> public_ip)
# 3-1-6. runtime-configs/dns.yml (deployments: 추가)
# 3-2. CF-DEPLOYMENT
# 3-2.1. paasta-deployment.yml(cf-deployment.yml 이름 변경, stemcell, 각 인스턴스 존, 수, vmtype, 공통변수등)
# 3-2.2. rename-network-and-deployment.yml(네트워크 이름)
# 3-2.3. use-haproxy.yml(CVE 조치, HAproxy 존, 수, vmtype)

# 4. 생성 파일
# 4-1. BOSH-DEPLOYMENT
# 4-1-1. deploy-{IaaS}.sh
# 4-1-2. deploy-{IaaS}-moniotoring.sh
# 4-1-3. delete-deploy-{IaaS}.sh
# 4-1-4. {IaaS}-vars.yml
# 4-1-5. runtime-configs/os-conf.yml
# 4-1-6. paasta-addon/paasta-monitoring-agent.yml
# 4-1-6. upload-stemcell.sh
# 4-1-6. update-runtime-config.yml

# 4-2. CLOUD-CONFIG
## 4-2.1. {IaaS}-cloud-config.yml

# 4-3. CF-DEPLOYMENT
# 4-3.1. deploy-{IaaS}.sh
# 4-3.2. {IaaS}-vars.yml

# 5. *_NEWLINE_CONVERT 변수는 개행문자를 임시로 치환하는 변수이다. 만약 =======GREP NEWLINE_CONVERT======= 메세지 사이에 GREP 한 문구가 HIT 된다면 자동화 스크립트를 중지하고 *_NEWLINE_CONVERT를 변경해야 함

# 6. use-compiled-**.yml 은 직접 수정이 필요함
# 6-1. BOSH-DEPLOYMENT
# 6-1.1. use-compiled-releases-aws.yml
# 6-1.2. use-compiled-releases-azure.yml
# 6-1.3. use-compiled-releases-bosh-lite.yml
# 6-1.4. use-compiled-releases-credhub.yml
# 6-1.5. use-compiled-releases-gcp.yml
# 6-1.6. use-compiled-releases-jumpbox.yml
# 6-1.7. use-compiled-releases-openstack.yml
# 6-1.8. use-compiled-releases-syslog.yml
# 6-1.9. use-compiled-releases-uaa.yml
# 6-1.10. use-compiled-releases-vsphere.yml
# 6-1.11. use-compiled-releases.yml
# 6-1.12. paasta-addon/use-compiled-releases-monitoring-agent.yml
# 6-2. CF-DEPLOYMENT
# 6-2-1. operation/use-compiled-releases-haproxy.yml
# 6-2-1. operation/use-compiled-releases-postgres.yml

# 7. 자동화 스크립트 작동시 위에 언급된 yml, sh 파일이 제대로 생성/변경되었는지 확인이 필요함
# 8. BOSH,CF 버전업을 하는 사람은 버전업으로 인한 BOSH-DEPLOYMENT, CF-DEPLOYMENT 변경때문에 원활한 수정이 안될 경우 작동 안되는 스크립트의 변경을 필요로 함





########## VARIABLES REGISTER ##########
echo "VARIABLES REGISTER!!"
source variable.sh


########## BOSH DEPLOYMENT ##########
echo "BOSH DEPLOYMENT START!!!!!!!!!!!!!!!!!!"

cd ${BOSH_DEPLOYMENT_PATH}

rm -r -f .git


# BOSH COMMON VARIABLES MODIFY
echo "BOSH COMMON VARIABLES MODIFY!!"
source ${SHELL_SCRIPT_PATH}/bosh/bosh-common-modify.sh

# BOSH.YML MODIFY
echo "BOSH.YML MODIFY!!"
source ${SHELL_SCRIPT_PATH}/bosh/bosh-yml-modify.sh

# IAAS-VARS.YML CREATE
echo "IAAS-VARS.YML CREATE!!"
source ${SHELL_SCRIPT_PATH}/bosh/iaas-vars-create.sh

# DEPLOY-IAAS.SH CREATE
echo "DEPLOY-IAAS.SH CREATE!!"
source ${SHELL_SCRIPT_PATH}/bosh/deploy-iaas-create.sh

# DEPLOY-IAAS-MONITORING.SH CREATE
echo "DEPLOY-IAAS-MONITORING.SH CREATE!!"
source ${SHELL_SCRIPT_PATH}/bosh/deploy-iaas-monitoring-create.sh

# DELETE-DEPLOY-IAAS.SH CREATE
echo "DELETE-DEPLOY-IAAS.SH CREATE!!"
source ${SHELL_SCRIPT_PATH}/bosh/delete-deploy-iaas-create.sh

# RUNTIME-CONFIG MODIFY
echo "RUNTIME-CONFIG MODIFY!!"
source ${SHELL_SCRIPT_PATH}/bosh/runtime-config-modify.sh

# PAASTA ADDON CREATE
echo "PAASTA ADDON CREATE!!"
source ${SHELL_SCRIPT_PATH}/bosh/paasta-addon-create.sh

# UPDATE-RUNTIME-CONFIG.SH UPLOAD-STEMCELL.SH CREATE
echo "UPDATE-RUNTIME-CONFIG.SH UPLOAD-STEMCELL.SH CREATE!!"
source ${SHELL_SCRIPT_PATH}/bosh/etc-create.sh


cd ${BOSH_DEPLOYMENT_PATH}
cd ..
mv bosh-deployment bosh



echo "BOSH DEPLOYMENT END!!!!!!!!!!!!!!!!!!"




########## CLOUD CONFIG ##########
echo "CLOUD CONFIG START!!!!!!!!!!!!!!!!!!"

mkdir ${CLOUD_CONFIG_CREATE_FOLDER_PATH}/cloud-config
cd ${CLOUD_CONFIG_CREATE_FOLDER_PATH}/cloud-config

# IAAS-CLOUD-CONFIG.YML CREATE
echo "IAAS-CLOUD-CONFIG.YML CREATE!!"
source ${SHELL_SCRIPT_PATH}/cloud-config/iaas-cloud-config-create.sh


echo "CLOUD CONFIG END!!!!!!!!!!!!!!!!!!"

########## CF DEPLOYMENT ##########
echo "CF DEPLOYMENT START!!!!!!!!!!!!!!!!!!"
cd ${CF_DEPLOYMENT_PATH}

rm -r -f .git

# CF COMMON VARIABLES MODIFY
echo "CF COMMON VARIABLES MODIFY!!"
source ${SHELL_SCRIPT_PATH}/paasta/cf-common-modify.sh

# CF-DEPLOYMENT.YML MODIFY
echo "CF-DEPLOYMENT.YML MODIFY!!"
source ${SHELL_SCRIPT_PATH}/paasta/cf-deployment-modify.sh

# USE-HAPROXY.YML MODIFY
echo "USE-HAPROXY.YML MODIFY!!"
source ${SHELL_SCRIPT_PATH}/paasta/use-haproxy-modify.sh

# RENAME-NETWORK-AND-DEPLOYMENT.YML MODIFY
echo "RENAME-NETWORK-AND-DEPLOYMENT.YML MODIFY!!"
source ${SHELL_SCRIPT_PATH}/paasta/rename-network-and-deployment-modify.sh

# IAAS-VARS.YML CREATE
echo "IAAS-VARS.YML CREATE!!"
source ${SHELL_SCRIPT_PATH}/paasta/iaas-vars-create.sh

# DEPLOY-IAAS.SH CREATE
echo "DEPLOY-IAAS.SH CREATE!!"
source ${SHELL_SCRIPT_PATH}/paasta/deploy-iaas-create.sh



cd ${CF_DEPLOYMENT_PATH}
cd ..
mv cf-deployment paasta-deployment

echo "CF DEPLOYMENT END!!!!!!!!!!!!!!!!!!"

cd ${SHELL_SCRIPT_PATH}

