#!/bin/bash


# CF-DEPLOYMENT NEWLINE_CONVERT CHECK

echo "=======GREP CF_DEPLOYMENT NEWLINE_CONVERT======="
grep "${CF_DEPLOYMENT_NEWLINE_CONVERT}" cf-deployment.yml
echo "=======GREP CF_DEPLOYMENT NEWLINE_CONVERT======="

# SLEEP!!!! AND ECHO CHECK
echo "NEWLINE_CONVERT CHECK!!!! IF HIT IT, END IT!!!!"
sleep 5

# CF-DEPLOYMENT NEWLINE_CONVERT
cat cf-deployment.yml | tr "\n" "${CF_DEPLOYMENT_NEWLINE_CONVERT}" >> temp-deployment.yml

# CF-DEPLOYMENT-> PAAS-TA CONVERT
sed -i -e 's/---+name: cf+manifest_version: v'${CF_VERSION}'/---+name: paasta+manifest_version: v'${PAASTA_VERSION}'/g' temp-deployment.yml
sed -i -e 's/- name: smoke-tests+  lifecycle: errand+  azs:+  - z1+  instances: 1+  vm_type: minimal/- name: smoke-tests+  lifecycle: errand+  azs: ((smoke_tests_azs))+  instances: ((smoke_tests_instances))+  vm_type: ((smoke_tests_vm_type))/g' temp-deployment.yml 
sed -i -e 's/- name: nats+  azs:+  - z1+  - z2+  instances: 2+  vm_type: minimal/- name: nats+  azs: ((nats_azs))+  instances: ((nats_instances))+  vm_type: ((nats_vm_type))/g'  temp-deployment.yml
sed -i -e 's/- name: database+  migrated_from:+  - name: mysql+  - name: singleton-database+  azs:+  - z1+  persistent_disk_type: 10GB+  instances: 1+  vm_type: small/- name: database+  migrated_from:+  - name: mysql+  - name: singleton-database+  azs: ((database_azs))+  persistent_disk_type: ((database_persistent_disk_type))+  instances: ((database_instances))+  vm_type: ((database_vm_type))/g'  temp-deployment.yml
sed -i -e 's/- name: diego-api+  migrated_from:+  - name: diego-bbs+  azs:+  - z1+  - z2+  instances: 2+  vm_type: small/- name: diego-api+  migrated_from:+  - name: diego-bbs+  azs: ((diego_api_azs))+  instances: ((diego_api_instances))+  vm_type: ((diego_api_vm_type))/g'  temp-deployment.yml
sed -i -e 's/- name: uaa+  azs:+  - z1+  - z2+  instances: 2+  vm_type: minimal/- name: uaa+  azs: ((uaa_azs))+  instances: ((uaa_instances))+  vm_type: ((uaa_vm_type))/g'  temp-deployment.yml
sed -i -e 's/- name: singleton-blobstore+  migrated_from:+  - name: blobstore+  azs:+  - z1+  instances: 1+  vm_type: small+  persistent_disk_type: 100GB/- name: singleton-blobstore+  migrated_from:+  - name: blobstore+  azs: ((singleton_blobstore_azs))+  instances: ((singleton_blobstore_instances))+  vm_type: ((singleton_blobstore_vm_type))+  persistent_disk_type: ((singleton_blobstore_persistent_disk_type))/g'  temp-deployment.yml
sed -i -e 's/- name: api+  azs:+  - z1+  - z2+  instances: 2+  vm_type: small+  vm_extensions:+  - 50GB_ephemeral_disk/- name: api+  azs: ((api_azs))+  instances: ((api_instances))+  vm_type: ((api_vm_type))+  vm_extensions: ((api_vm_extensions))/g'  temp-deployment.yml
sed -i -e 's/- name: cc-worker+  azs:+  - z1+  - z2+  instances: 2+  vm_type: minimal/- name: cc-worker+  azs: ((cc_worker_azs))+  instances: ((cc_worker_instances))+  vm_type: ((cc_worker_vm_type))/g'  temp-deployment.yml
sed -i -e 's/- name: scheduler+  azs:+  - z1+  - z2+  instances: 2+  migrated_from:+  - {name: cc-bridge}+  - {name: cc-clock}+  - {name: diego-brain}+  vm_type: minimal+  vm_extensions:+  - diego-ssh-proxy-network-properties/- name: scheduler+  azs: ((scheduler_azs))+  instances: ((scheduler_instances))+  migrated_from:+  - {name: cc-bridge}+  - {name: cc-clock}+  - {name: diego-brain}+  vm_type: ((scheduler_vm_type))+  vm_extensions: ((scheduler_vm_extensions))/g'  temp-deployment.yml
sed -i -e 's/- name: router+  azs:+  - z1+  - z2+  instances: 2+  vm_type: minimal+  vm_extensions:+  - cf-router-network-properties/- name: router+  azs: ((router_azs))+  instances: ((router_instances))+  vm_type: ((router_vm_type))+  vm_extensions: ((router_vm_extensions))/g'  temp-deployment.yml
sed -i -e 's/- name: tcp-router+  azs:+  - z1+  - z2+  instances: 2+  vm_type: minimal+  stemcell: default+  vm_extensions:+  - cf-tcp-router-network-properties/- name: tcp-router+  azs: ((tcp_router_azs))+  instances: ((tcp_router_instances))+  vm_type: ((tcp_router_vm_type))+  stemcell: default+  vm_extensions: ((tcp_router_vm_extensions))/g'  temp-deployment.yml
sed -i -e 's/- name: doppler+  azs:+  - z1+  - z2+  instances: 4+  vm_type: minimal/- name: doppler+  azs: ((doppler_azs))+  instances: ((doppler_instances))+  vm_type: ((doppler_vm_type))/g'  temp-deployment.yml
sed -i -e 's/- name: diego-cell+  azs:+  - z1+  - z2+  instances: 3+  vm_type: small-highmem+  vm_extensions:+  - 100GB_ephemeral_disk/- name: diego-cell+  azs: ((diego_cell_azs))+  instances: ((diego_cell_instances))+  vm_type: ((diego_cell_vm_type))+  vm_extensions: ((diego_cell_vm_extensions))/g'  temp-deployment.yml
sed -i -e 's/- name: log-api+  azs:+  - z1+  - z2+  instances: 2+  vm_type: minimal/- name: log-api+  azs: ((log_api_azs))+  instances: ((log_api_instances))+  vm_type: ((log_api_vm_type))/g'  temp-deployment.yml
sed -i -e 's/- name: credhub+  azs:+  - z1+  - z2+  instances: 2+  networks:+  - name: default+  stemcell: default+  vm_type: minimal/- name: credhub+  azs: ((credhub_azs))+  instances: ((credhub_instances))+  networks:+  - name: default+  stemcell: default+  vm_type: ((credhub_vm_type))/g'  temp-deployment.yml
sed -i -e 's/- name: rotate-cc-database-key+  azs:+  - z1+  instances: 1+  lifecycle: errand+  vm_type: minimal/- name: rotate-cc-database-key+  azs: ((rotate_cc_database_key_azs))+  instances: ((rotate_cc_database_key_instances))+  lifecycle: errand+  vm_type: ((rotate_cc_database_key_vm_type))/g'  temp-deployment.yml
sed -i -e 's/- name: admin/- name: ((paasta_admin_username))/g'  temp-deployment.yml
sed -i -e 's/certificate: "((uaa_login_saml.certificate))"+              passphrase: ""+      uaa:/certificate: "((uaa_login_saml.certificate))"+              passphrase: ""+        ## PAAS-TA PORTAL PROPERTIES ADD START+        logout:+          redirect:+            parameter:+              disable: "((uaa_login_logout_redirect_parameter_disable))"+              whitelist: "((uaa_login_logout_redirect_parameter_whitelist))"+        branding:+          company_name: "((uaa_login_branding_company_name))"+          product_logo: "((uaa_login_branding_product_logo))"+          square_logo: "((uaa_login_branding_square_logo))"+          footer_legal_text: "((uaa_login_branding_footer_legal_text))"+        links:+          passwd: "((uaa_login_links_passwd))"+          signup: "((uaa_login_links_signup))"+        ## PAAS-TA PORTAL PROPERTIES ADD END+      uaa:/g' temp-deployment.yml
sed -i -e 's/tcp_router:+            authorities: routing.routes.read+            authorized-grant-types: client_credentials+            secret: "((uaa_clients_tcp_router_secret))"+        ca_certs:/tcp_router:+            authorities: routing.routes.read+            authorized-grant-types: client_credentials+            secret: "((uaa_clients_tcp_router_secret))"+          ## PAAS-TA PORTAL USER ACCOUNT ADD START+          portalclient:+            redirect-uri: "((uaa_client_portal_redirect_uri))"+            scope: cloud_controller_service_permissions.read,openid,cloud_controller.read,cloud_controller.write,cloud_controller.admin+            autoapprove: openid,cloud_controller_service_permissions.read+            authorities: uaa.resource+            authorized-grant-types: authorization_code,client_credentials,refresh_token+            secret: "((uaa_client_portal_secret))"+          ## PAAS-TA PORTAL USER ACCOUNT ADD END+        ca_certs:/g' temp-deployment.yml
sed -i -e 's/stemcells:+- alias: default+  os: ubuntu-xenial+  version: "'${CF_STEMCELL}'"/stemcells:+- alias: default+  os: ((stemcell_os))+  version: ((stemcell_version))/g' temp-deployment.yml

# CF-DEPLOYMENT NEWLINE_RECONVERT
cat temp-deployment.yml | tr "${CF_DEPLOYMENT_NEWLINE_CONVERT}" "\n" >> paasta-deployment.yml

# TEMP & CF-DEPLOYMENT DELETE
rm temp-deployment.yml
rm cf-deployment.yml


