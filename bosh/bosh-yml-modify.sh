#!/bin/bash

# BOSH DEPLOYMENT NEWLINE_CONVERT CHECK

echo "=======GREP BOSH NEWLINE_CONVERT======="
grep "${BOSH_NEWLINE_CONVERT}" bosh.yml
echo "=======GREP BOSH NEWLINE_CONVERT======="

# SLEEP!!!! AND ECHO CHECK
echo "NEWLINE_CONVERT CHECK!!!! IF HIT IT, END IT!!!!"
sleep 5

# BOSH DEPLOYMENT NEWLINE_CONVERT
cat bosh.yml | tr "\n" "${BOSH_NEWLINE_CONVERT}" >> temp-bosh.yml


# BOSH DEPLOYMENT CONVERT
sed -i -e 's/name: admin+            password: ((admin_password))/name: ((bosh_client_admin_id))+            password: ((admin_password))/g' temp-bosh.yml


# BOSH DEPLOYMENT NEWLINE_RECONVERT
cat temp-bosh.yml | tr "${BOSH_NEWLINE_CONVERT}" "\n" >> new-bosh.yml


# TEMP & BOSH DEPLOYMENT CHANGE
rm temp-bosh.yml
rm bosh.yml
mv new-bosh.yml bosh.yml

