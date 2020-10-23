#!/bin/bash

# CF HAPROXY NEWLINE_CONVERT CHECK
cd ${CF_DEPLOYMENT_PATH}/operations
echo "=======GREP CF_HAPROXY NEWLINE_CONVERT======="
grep "${CF_HAPROXY_NEWLINE_CONVERT}" use-haproxy.yml
echo "=======GREP CF_HAPROXY NEWLINE_CONVERT======="

# SLEEP!!!! AND ECHO CHECK
echo "NEWLINE_CONVERT CHECK!!!! IF HIT IT, END IT!!!!"
sleep 5

# CF HAPROXY NEWLINE_CONVERT
cat use-haproxy.yml | tr "\n" "${CF_HAPROXY_NEWLINE_CONVERT}" >> temp-use-haproxy.yml

# CF HAPROXY CONVERT
sed -i -e 's/value:@    azs:@    - z1@    instances: 1/value:@    azs: ((haproxy_azs))@    instances: ((haproxy_instances))/g' temp-use-haproxy.yml
sed -i -e 's/tcp_link_port: 2222/tcp_link_port: 2222@          enable_4443: true@          disable_tls_10: true@          disable_tls_11: true@          ssl_ciphers: "ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-AES256-GCM-SHA384:DHE-RSA-AES128-GCM-SHA256:DHE-DSS-AES128-GCM-SHA256:kEDH+AESGCM:ECDHE-RSA-AES128-SHA256:ECDHE-ECDSA-AES128-SHA256:ECDHE-RSA-AES128-SHA:ECDHE-ECDSA-AES128-SHA:ECDHE-RSA-AES256-SHA384:ECDHE-ECDSA-AES256-SHA384:ECDHE-RSA-AES256-SHA:ECDHE-ECDSA-AES256-SHA:DHE-RSA-AES128-SHA256:DHE-RSA-AES128-SHA:DHE-DSS-AES128-SHA256:DHE-RSA-AES256-SHA256:DHE-DSS-AES256-SHA:DHE-RSA-AES256-SHA:!aNULL:!eNULL:!EXPORT:!DES:!RC4:!3DES:!MD5:!PSK"/g' temp-use-haproxy.yml
sed -i -e 's/vm_type: minimal/vm_type: ((haproxy_vm_type))/g' temp-use-haproxy.yml

# CF HAPROXY NEWLINE_RECONVERT
cat temp-use-haproxy.yml | tr "${CF_HAPROXY_NEWLINE_CONVERT}" "\n" >> new-use-haproxy.yml


# TEMP & CF HAPROXY DELETE
rm temp-use-haproxy.yml
rm use-haproxy.yml
mv new-use-haproxy.yml use-haproxy.yml



