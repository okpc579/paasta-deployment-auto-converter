#!/bin/bash



# CF RENAME-NETWORK-AND-DEPLOYMENT NEWLINE_CONVERT CHECK
echo "=======GREP CF_RENAME NEWLINE_CONVERT======="
grep "${CF_RENAME_NEWLINE_CONVERT}" rename-network-and-deployment.yml
echo "=======GREP CF_RENAME NEWLINE_CONVERT======="

# SLEEP!!!! AND ECHO CHECK
echo "NEWLINE_CONVERT CHECK!!!! IF HIT IT, END IT!!!!"
sleep 5

# CF RENAME-NETWORK-AND-DEPLOYMENT NEWLINE_CONVERT
cat rename-network-and-deployment.yml | tr "\n" "${CF_RENAME_NEWLINE_CONVERT}" >> temp-rename-network-and-deployment.yml

# CF RENAME-NETWORK-AND-DEPLOYMENT CONVERT
sed -i -e 's/path: \/instance_groups\/name=smoke-tests\/networks\/name=default\/name+  value: ((network_name))/path: \/instance_groups\/name=smoke-tests\/networks\/name=default\/name+  value: ((smoke_tests_network))/g' temp-rename-network-and-deployment.yml
sed -i -e 's/path: \/instance_groups\/name=nats\/networks\/name=default\/name+  value: ((network_name))/path: \/instance_groups\/name=nats\/networks\/name=default\/name+  value: ((nats_network))/g' temp-rename-network-and-deployment.yml
sed -i -e 's/path: \/instance_groups\/name=doppler\/networks\/name=default\/name+  value: ((network_name))/path: \/instance_groups\/name=doppler\/networks\/name=default\/name+  value: ((doppler_network))/g' temp-rename-network-and-deployment.yml
sed -i -e 's/path: \/instance_groups\/name=database\/networks\/name=default\/name+  value: ((network_name))/path: \/instance_groups\/name=database\/networks\/name=default\/name+  value: ((database_network))/g' temp-rename-network-and-deployment.yml
sed -i -e 's/path: \/instance_groups\/name=diego-api\/networks\/name=default\/name+  value: ((network_name))/path: \/instance_groups\/name=diego-api\/networks\/name=default\/name+  value: ((diego_api_network))/g' temp-rename-network-and-deployment.yml
sed -i -e 's/path: \/instance_groups\/name=uaa\/networks\/name=default\/name+  value: ((network_name))/path: \/instance_groups\/name=uaa\/networks\/name=default\/name+  value: ((uaa_network))/g' temp-rename-network-and-deployment.yml
sed -i -e 's/path: \/instance_groups\/name=singleton-blobstore\/networks\/name=default\/name+  value: ((network_name))/path: \/instance_groups\/name=singleton-blobstore\/networks\/name=default\/name+  value: ((singleton_blobstore_network))/g' temp-rename-network-and-deployment.yml
sed -i -e 's/path: \/instance_groups\/name=api\/networks\/name=default\/name+  value: ((network_name))/path: \/instance_groups\/name=api\/networks\/name=default\/name+  value: ((api_network))/g' temp-rename-network-and-deployment.yml
sed -i -e 's/path: \/instance_groups\/name=cc-worker\/networks\/name=default\/name+  value: ((network_name))/path: \/instance_groups\/name=cc-worker\/networks\/name=default\/name+  value: ((cc_worker_network))/g' temp-rename-network-and-deployment.yml
sed -i -e 's/path: \/instance_groups\/name=router\/networks\/name=default\/name+  value: ((network_name))/path: \/instance_groups\/name=router\/networks\/name=default\/name+  value: ((router_network))/g' temp-rename-network-and-deployment.yml
sed -i -e 's/path: \/instance_groups\/name=scheduler\/networks\/name=default\/name+  value: ((network_name))/path: \/instance_groups\/name=scheduler\/networks\/name=default\/name+  value: ((scheduler_network))/g' temp-rename-network-and-deployment.yml
sed -i -e 's/path: \/instance_groups\/name=diego-cell\/networks\/name=default\/name+  value: ((network_name))/path: \/instance_groups\/name=diego-cell\/networks\/name=default\/name+  value: ((diego_cell_network))/g' temp-rename-network-and-deployment.yml
sed -i -e 's/path: \/instance_groups\/name=log-api\/networks\/name=default\/name+  value: ((network_name))/path: \/instance_groups\/name=log-api\/networks\/name=default\/name+  value: ((log_api_network))/g' temp-rename-network-and-deployment.yml
sed -i -e 's/path: \/instance_groups\/name=tcp-router\/networks\/name=default\/name+  value: ((network_name))/path: \/instance_groups\/name=tcp-router\/networks\/name=default\/name+  value: ((tcp_router_network))/g' temp-rename-network-and-deployment.yml
sed -i -e 's/path: \/instance_groups\/name=credhub\/networks\/name=default\/name+  value: ((network_name))/path: \/instance_groups\/name=credhub\/networks\/name=default\/name+  value: ((credhub_network))/g' temp-rename-network-and-deployment.yml
sed -i -e 's/path: \/instance_groups\/name=rotate-cc-database-key\/networks\/name=default\/name+  value: ((network_name))/path: \/instance_groups\/name=rotate-cc-database-key\/networks\/name=default\/name+  value: ((rotate_cc_database_key_network))/g' temp-rename-network-and-deployment.yml
sed -i -e 's/instance_group: diego-cell+      deployment: ((deployment_name))+      network: ((network_name))/instance_group: diego-cell+      deployment: ((deployment_name))+      network: ((diego_cell_network))/g' temp-rename-network-and-deployment.yml
sed -i -e 's/instance_group: isolated-diego-cell+      deployment: ((deployment_name))+      network: ((network_name))/instance_group: isolated-diego-cell+      deployment: ((deployment_name))+      network: ((diego_cell_network))/g' temp-rename-network-and-deployment.yml
sed -i -e 's/instance_group: scheduler+      deployment: ((deployment_name))+      network: ((network_name))/instance_group: scheduler+      deployment: ((deployment_name))+      network: ((scheduler_network))/g' temp-rename-network-and-deployment.yml
sed -i -e 's/instance_group: diego-api+      deployment: ((deployment_name))+      network: ((network_name))/instance_group: diego-api+      deployment: ((deployment_name))+      network: ((diego_api_network))/g' temp-rename-network-and-deployment.yml
sed -i -e 's/instance_group: singleton-blobstore+      deployment: ((deployment_name))+      network: ((network_name))/instance_group: singleton-blobstore+      deployment: ((deployment_name))+      network: ((singleton_blobstore_network))/g' temp-rename-network-and-deployment.yml
sed -i -e 's/instance_group: api+      deployment: ((deployment_name))+      network: ((network_name))/instance_group: api+      deployment: ((deployment_name))+      network: ((api_network))/g' temp-rename-network-and-deployment.yml
sed -i -e 's/instance_group: credhub+      deployment: ((deployment_name))+      network: ((network_name))/instance_group: credhub+      deployment: ((deployment_name))+      network: ((credhub_network))/g' temp-rename-network-and-deployment.yml
sed -i -e 's/instance_group: doppler+      deployment: ((deployment_name))+      network: ((network_name))/instance_group: doppler+      deployment: ((deployment_name))+      network: ((doppler_network))/g' temp-rename-network-and-deployment.yml
sed -i -e 's/instance_group: router+      deployment: ((deployment_name))+      network: ((network_name))/instance_group: router+      deployment: ((deployment_name))+      network: ((router_network))/g' temp-rename-network-and-deployment.yml
sed -i -e 's/instance_group: log-api+      deployment: ((deployment_name))+      network: ((network_name))/instance_group: log-api+      deployment: ((deployment_name))+      network: ((log_api_network))/g' temp-rename-network-and-deployment.yml
sed -i -e 's/instance_group: nats+      deployment: ((deployment_name))+      network: ((network_name))/instance_group: nats+      deployment: ((deployment_name))+      network: ((nats_network))/g' temp-rename-network-and-deployment.yml
sed -i -e 's/instance_group: database+      deployment: ((deployment_name))+      network: ((network_name))/instance_group: database+      deployment: ((deployment_name))+      network: ((database_network))/g' temp-rename-network-and-deployment.yml
sed -i -e 's/instance_group: uaa+      deployment: ((deployment_name))+      network: ((network_name))/instance_group: uaa+      deployment: ((deployment_name))+      network: ((uaa_network))/g' temp-rename-network-and-deployment.yml

# CF RENAME-NETWORK-AND-DEPLOYMENT NEWLINE_RECONVERT
cat temp-rename-network-and-deployment.yml | tr "${CF_RENAME_NEWLINE_CONVERT}" "\n" >> new-rename-network-and-deployment.yml


# TEMP & CF RENAME-NETWORK-AND-DEPLOYMENT DELETE
rm temp-rename-network-and-deployment.yml
rm rename-network-and-deployment.yml
mv new-rename-network-and-deployment.yml rename-network-and-deployment.yml


