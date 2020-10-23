#!/bin/bash

# CF COMMON_VARS CHANGE
find . -type f | xargs sed -i -e 's/cf_admin_password/paasta_admin_password/g' 
find . -type f | xargs sed -i -e 's/cc_database_password/paasta_cc_db_password/g' 
find . -type f | xargs sed -i -e 's/uaa_database_password/paasta_uaa_db_password/g' 
find . -type f | xargs sed -i -e 's/uaa_admin_client_secret/uaa_client_admin_secret/g' 
