#!/bin/bash



echo 'azs:
- cloud_properties:
    availability_zone: ap-northeast-2a
  name: z1
- cloud_properties:
    availability_zone: ap-northeast-2a
  name: z2
- cloud_properties:
    availability_zone: ap-northeast-2a
  name: z3
- cloud_properties:
    availability_zone: ap-northeast-2a
  name: z4
- cloud_properties:
    availability_zone: ap-northeast-2a
  name: z5
- cloud_properties:
    availability_zone: ap-northeast-2a
  name: z6
- cloud_properties:
    availability_zone: ap-northeast-2a
  name: z7

compilation:
  az: z4
  network: default
  reuse_compilation_vms: true
  vm_type: xlarge
  workers: 5

disk_types:
- disk_size: 1024
  name: default
- disk_size: 1024
  name: 1GB
- disk_size: 2048
  name: 2GB
- disk_size: 5120
  name: 5GB
- disk_size: 8192
  name: 8GB
- disk_size: 10240
  name: 10GB
- disk_size: 20480
  name: 20GB
- disk_size: 30720
  name: 30GB
- disk_size: 51200
  name: 50GB
- disk_size: 102400
  name: 100GB
- disk_size: 512000
  name: 500GB
- cloud_properties:
    type: gp2
  disk_size: 20000
  name: 2GB_GP2
- cloud_properties:
    type: gp2
  disk_size: 50000
  name: 5GB_GP2
- cloud_properties:
    type: gp2
  disk_size: 100000
  name: 10GB_GP2
- cloud_properties:
    type: gp2
  disk_size: 500000
  name: 50GB_GP2

networks:
- name: default
  subnets:
  - az: z1
    cloud_properties:
      security_groups: paasta-v50-security
      subnet: subnet-XXXXXXXXXXXXXXXXX
    dns:
    - 8.8.8.8
    gateway: 10.0.1.1
    range: 10.0.1.0/24
    reserved:
    - 10.0.1.2 - 10.0.1.9
    static:
    - 10.0.1.10 - 10.0.1.120
  - az: z2
    cloud_properties:
      security_groups: paasta-v50-security
      subnet: subnet-XXXXXXXXXXXXXXXXX
    dns:
    - 8.8.8.8
    gateway: 10.1.41.1
    range: 10.1.41.0/24
    reserved:
    - 10.1.41.1 - 10.1.41.9
    static:
    - 10.1.41.10 - 10.1.41.120
  - az: z3
    cloud_properties:
      security_groups: paasta-v50-security
      subnet: subnet-XXXXXXXXXXXXXXXXX
    dns:
    - 8.8.8.8
    gateway: 10.2.81.1
    range: 10.2.81.0/24
    reserved:
    - 10.2.81.1 - 10.2.81.9
    static:
    - 10.2.81.10 - 10.2.81.120
  - az: z4
    cloud_properties:
      security_groups: paasta-v50-security
      subnet: subnet-XXXXXXXXXXXXXXXXX
    dns:
    - 8.8.8.8
    gateway: 10.3.121.1
    range: 10.3.121.0/24
    reserved:
    - 10.3.121.1 - 10.3.121.9
    static:
    - 10.3.121.10 - 10.3.121.120
  - az: z5
    cloud_properties:
      security_groups: paasta-v50-security
      subnet: subnet-XXXXXXXXXXXXXXXXX
    dns:
    - 8.8.8.8
    gateway: 10.4.161.1
    range: 10.4.161.0/24
    reserved:
    - 10.4.161.1 - 10.4.161.9
    static:
    - 10.4.161.10 - 10.4.161.120
  - az: z6
    cloud_properties:
      security_groups: paasta-v50-security
      subnet: subnet-XXXXXXXXXXXXXXXXX
    dns:
    - 8.8.8.8
    gateway: 10.5.201.1
    range: 10.5.201.0/24
    reserved:
    - 10.5.201.1 - 10.5.201.9
    static:
    - 10.5.201.10 - 10.5.201.120
  - az: z7
    cloud_properties:
      security_groups: paasta-v50-security
      subnet: subnet-XXXXXXXXXXXXXXXXX
    dns:
    - 8.8.8.8
    gateway: 10.6.0.1
    range: 10.6.0.0/24
    reserved:
    - 10.6.0.1 - 10.6.0.9
    static:
    - 10.6.0.10 - 10.6.0.120
  type: manual

- name: vip
  type: vip

properties:
  aws:
    access_key_id: "XXXXXXXXXXXXXXXXXXX"
    default_key_name: aws-paasta-rnd-v50-inception.pem
    default_security_groups:
    - paasta-v50-security
    region: ap-northeast-2
    secret_access_key: "XXXXXXXXXXXXXXXXXXXXXX"

vm_extensions:
- name: cf-router-network-properties
- name: cf-tcp-router-network-properties
- name: diego-ssh-proxy-network-properties
- name: cf-haproxy-network-properties
- cloud_properties:
    ephemeral_disk:
      size: 51200
      type: gp2
  name: 50GB_ephemeral_disk
- cloud_properties:
    ephemeral_disk:
      size: 102400
      type: gp2
  name: 100GB_ephemeral_disk

vm_types:
- cloud_properties:
    ephemeral_disk:
      size: 3000
      type: gp2
    instance_type: t2.small
  name: minimal
- cloud_properties:
    ephemeral_disk:
      size: 10000
      type: gp2
    instance_type: t2.small
  name: small
- cloud_properties:
    ephemeral_disk:
      size: 50000
      type: gp2
    instance_type: t2.medium
  name: medium
- cloud_properties:
    ephemeral_disk:
      size: 50000
      type: gp2
    instance_type: t2.large
  name: large
- cloud_properties:
    ephemeral_disk:
      size: 50000
      type: gp2
    instance_type: t2.xlarge
  name: xlarge
- cloud_properties:
    ephemeral_disk:
      size: 30000
      type: gp2
    instance_type: t2.xlarge
  name: small-highmem-16GB
- cloud_properties:
    ephemeral_disk:
      size: 30000
      type: gp2
    instance_type: t2.2xlarge
  name: large-highmem-32GB
- cloud_properties:
    ephemeral_disk:
      size: 3000
      type: gp2
    instance_type: t2.small
  name: service_tiny
- cloud_properties:
    ephemeral_disk:
      size: 3000
      type: gp2
    instance_type: t2.small
  name: service_small
- cloud_properties:
    ephemeral_disk:
      size: 10000
      type: gp2
    instance_type: t2.small
  name: service_medium_1CPU_2G
- cloud_properties:
    ephemeral_disk:
      size: 8000
      type: gp2
    instance_type: t2.medium
  name: service_medium
- cloud_properties:
    ephemeral_disk:
      size: 10000
      type: gp2
    instance_type: t2.medium
  name: service_medium_2G
- cloud_properties:
    ephemeral_disk:
      size: 3000
      type: gp2
    instance_type: t2.small
  name: portal_tiny
- cloud_properties:
    ephemeral_disk:
      size: 3000
      type: gp2
    instance_type: t2.small
  name: portal_small
- cloud_properties:
    ephemeral_disk:
      size: 4096
      type: gp2
    instance_type: t2.small
  name: portal_medium
- cloud_properties:
    ephemeral_disk:
      size: 4096
      type: gp2
    instance_type: t2.small
  name: portal_large
- cloud_properties:
    ephemeral_dist:
      size: 4096
      type: gp2
    instance_type: t2.small
  name: caas_small
- cloud_properties:
    ephemeral_dist:
      size: 30000
      type: gp2
    instance_type: m4.xlarge
  name: caas_small_highmem' > aws-cloud-config.yml


echo 'azs:
- name: z1
- name: z2
- name: z3
- name: z4
- name: z5
- name: z6
- name: z7

vm_types:
- name: minimal
  cloud_properties:
    instance_type: Standard_A2_v2
- name: default
  cloud_properties:
    instance_type: Standard_A2_v2
- name: small
  cloud_properties:
    instance_type: Standard_A2_v2
- name: medium
  cloud_properties:
    instance_type: Standard_A4_v2
- name: medium-memory-8GB
  cloud_properties:
    instance_type: Standard_A4_v2
- name: large
  cloud_properties:
    instance_type: Standard_A8_v2
- name: xlarge
  cloud_properties:
    instance_type: Standard_A8_v2
- name: small-50GB
  cloud_properties:
    instance_type: Standard_A2m_v2
- name: small-50GB-ephemeral-disk
  cloud_properties:
    instance_type: Standard_A4_v2
- name: small-100GB-ephemeral-disk
  cloud_properties:
    instance_type: Standard_A4_v2
- name: small-highmem-100GB-ephemeral-disk
  cloud_properties:
    instance_type: Standard_A4m_v2
- name: small-highmem-16GB
  cloud_properties:
    instance_type: Standard_A2m_v2
- name: service_tiny
  cloud_properties:
    instance_type: Standard_A2_v2
- name: service_small
  cloud_properties:
    instance_type: Standard_A2_v2
- name: service_medium
  cloud_properties:
    instance_type: Standard_A2_v2
- name: service_medium_1CPU_2G
  cloud_properties:
    instance_type: Standard_A2_v2
- name: service_medium_2G
  cloud_properties:
    instance_type: Standard_A4_v2
- name: portal_tiny
  cloud_properties:
    instance_type: Standard_A2_v2
- name: portal_small
  cloud_properties:
    instance_type: Standard_A2_v2
- name: portal_medium
  cloud_properties:
    instance_type: Standard_A2_v2
- name: portal_large
  cloud_properties:
    instance_type: Standard_A2_v2

compilation:
  az: z3
  network: default
  reuse_compilation_vms: true
  vm_type: large
  workers: 25

disk_types:
- disk_size: 1024
  name: default
- disk_size: 1024
  name: 1GB
- disk_size: 2048
  name: 2GB
- disk_size: 4096
  name: 4GB
- disk_size: 5120
  name: 5GB
- disk_size: 8192
  name: 8GB
- disk_size: 10240
  name: 10GB
- disk_size: 20480
  name: 20GB
- disk_size: 30720
  name: 30GB
- disk_size: 51200
  name: 50GB
- disk_size: 102400
  name: 100GB
- disk_size: 1048576
  name: 1TB

- cloud_properties:
    type: SSD1
  disk_size: 2000
  name: 2GB_GP2
- cloud_properties:
    type: SSD1
  disk_size: 5000
  name: 5GB_GP2
- cloud_properties:
    type: SSD1
  disk_size: 10000
  name: 10GB_GP2
- cloud_properties:
    type: SSD1
  disk_size: 50000
  name: 50GB_GP2

networks:
- name: default
  subnets:
  - az: z1
    cloud_properties:
      name: random
      virtual_network_name: paasta-v50-bosh-net
      subnet_name: paasta-v50-private-subnet-1
      security_group: paasta-v50-nsg
    dns:
    - 8.8.8.8
    gateway: 10.0.1.1
    range: 10.0.1.0/24
    reserved:
    - 10.0.1.1 - 10.0.1.9
    static:
    - 10.0.1.10 - 10.0.1.120
  - az: z2
    cloud_properties:
      name: random
      virtual_network_name: paasta-v50-bosh-net
      subnet_name: paasta-v50-private-subnet-2
      security_group: paasta-v50-nsg
    dns:
    - 8.8.8.8
    gateway: 10.0.41.1
    range: 10.0.41.0/24
    reserved:
    - 10.0.41.1 - 10.0.41.9
    static:
    - 10.0.41.10 - 10.0.41.120
  - az: z3
    cloud_properties:
      name: random
      virtual_network_name: paasta-v50-bosh-net
      subnet_name: paasta-v50-private-subnet-3
      security_group: paasta-v50-nsg
    dns:
    - 8.8.8.8
    gateway: 10.0.81.1
    range: 10.0.81.0/24
    reserved:
    - 10.0.81.1 - 10.0.81.9
    static:
    - 10.0.81.10 - 10.0.81.120
  - az: z4
    cloud_properties:
      name: random
      virtual_network_name: paasta-v50-bosh-net
      subnet_name: paasta-v50-private-subnet-4
      security_group: paasta-v50-nsg
    dns:
    - 8.8.8.8
    gateway: 10.0.121.1
    range: 10.0.121.0/24
    reserved:
    - 10.0.121.1 - 10.0.121.9
    static:
    - 10.0.121.10 - 10.0.121.120
  - az: z5
    cloud_properties:
      name: random
      virtual_network_name: paasta-v50-bosh-net
      subnet_name: paasta-v50-private-subnet-5
      security_group: paasta-v50-nsg
    dns:
    - 8.8.8.8
    gateway: 10.0.161.1
    range: 10.0.161.0/24
    reserved:
    - 10.0.161.1 - 10.0.161.9
    static:
    - 10.0.161.10 - 10.0.161.120
  - az: z6
    cloud_properties:
      name: random
      virtual_network_name: paasta-v50-bosh-net
      subnet_name: paasta-v50-private-subnet-6
      security_group: paasta-v50-nsg
    dns:
    - 8.8.8.8
    gateway: 10.0.201.1
    range: 10.0.201.0/24
    reserved:
    - 10.0.201.1 - 10.0.201.9
    static:
    - 10.0.201.10 - 10.0.201.120
  - az: z7
    cloud_properties:
      name: random
      virtual_network_name: paasta-v50-bosh-net
      subnet_name: paasta-v50-public-subnet
      security_group: paasta-v50-nsg
    dns:
    - 8.8.8.8
    gateway: 10.0.0.1
    range: 10.0.0.0/24
    reserved:
    - 10.0.0.1 - 10.0.0.9
    static:
    - 10.0.0.10 - 10.0.0.120

- name: vip
  type: vip

vm_extensions:
- cloud_properties:
    ports:
    - host: 3306
  name: mysql-proxy-lb
- name: cf-router-network-properties
- name: cf-tcp-router-network-properties
- name: diego-ssh-proxy-network-properties
- name: cf-haproxy-network-properties
- cloud_properties:
    ephemeral_disk:
      size: 51200
      type: gp2
  name: 50GB_ephemeral_disk
- cloud_properties:
    ephemeral_disk:
      size: 102400
      type: gp2
  name: 100GB_ephemeral_disk' > azure-cloud-config.yml
  
echo 'azs:

- name: z1

- name: z2

- name: z3

compilation:

  az: z1

  network: default

  reuse_compilation_vms: true

  vm_type: minimal

  workers: 6

disk_types:

- disk_size: 1024

  name: 1GB

- disk_size: 5120

  name: 5GB

- disk_size: 10240

  name: 10GB

- disk_size: 100240

  name: 100GB

# Note: the "default" disk type is not used in cf-deployment.

# it is included for compatibility with the bosh-deployment

# cloud-config.

- disk_size: 1024

  name: default

networks:

- name: default

  subnets:

  - azs: [z1, z2, z3]

    cloud_properties:

      name: random

    gateway: 10.244.0.1

    range: 10.244.0.0/20

    reserved:

    - 10.244.0.1

    static:

    - 10.244.0.2 - 10.244.0.127

    - 10.244.1.0 - 10.244.1.127

    - 10.244.2.0 - 10.244.2.127

    - 10.244.3.0 - 10.244.3.127

vm_extensions:

- name: 5GB_ephemeral_disk

- name: 10GB_ephemeral_disk

- name: 50GB_ephemeral_disk

- name: 100GB_ephemeral_disk

- name: 500GB_ephemeral_disk

- name: 1TB_ephemeral_disk

- name: ssh-proxy-and-router-lb

  cloud_properties:

    ports:

    - host: 80

    - host: 443

    - host: 2222

- name: cf-tcp-router-network-properties

  cloud_properties:

    ports:

    - host: 1024-1123

- name: credhub-lb

  cloud_properties:

    ports:

    - host: 8845

vm_types:

- name: minimal

- name: small

- name: medium

- name: medium-memory-8GB

- name: small-50GB-ephemeral-disk 

- name: small-100GB-ephemeral-disk

- name: small-highmem-16GB

- name: small-highmem

# Note: the "default" vm type is not used in cf-deployment.

# it is included for compatibility with the bosh-deployment

# cloud-config.

- name: default' > bosh-lite-cloud-config.yml

echo 'azs:
- name: z1
  cloud_properties:
    zone: asia-northeast1-a
- name: z2
  cloud_properties:
    zone: asia-northeast1-a
- name: z3
  cloud_properties:
    zone: asia-northeast1-a
- name: z4
  cloud_properties:
    zone: asia-northeast1-b
- name: z5
  cloud_properties:
    zone: asia-northeast1-b
- name: z6
  cloud_properties:
    zone: asia-northeast1-c
- name: z7
  cloud_properties:
    zone: asia-northeast1-a

vm_types:
- name: minimal
  cloud_properties:
    machine_type: n1-standard-1
- name: default 
  cloud_properties:
    machine_type: n1-standard-2
- name: small
  cloud_properties:
    machine_type: n1-standard-2
- name: medium
  cloud_properties:
    machine_type: n1-standard-2
- name: medium-memory-8GB
  cloud_properties:
    machine_type: n1-standard-4
- name: large
  cloud_properties:
    machine_type: n1-standard-4
- name: xlarge
  cloud_properties:
    machine_type: n1-standard-8
- name: small-50GB
  cloud_properties:
    machine_type: n1-standard-1
- name: small-50GB-ephemeral-disk 
  cloud_properties:
    machine_type: n1-standard-2
- name: small-100GB-ephemeral-disk
  cloud_properties:
    machine_type: n1-standard-4
    root_disk_size_gb: 20
    root_disk_type: pd-ssd
- name: small-highmem-100GB-ephemeral-disk 
  cloud_properties:
    machine_type: n1-standard-4
    root_disk_size_gb: 40
    root_disk_type: pd-ssd
- name: small-highmem-16GB
  cloud_properties:
    machine_type: n1-standard-16
    root_disk_size_gb: 80 
    root_disk_type: pd-ssd
- name: service_tiny
  cloud_properties:
    machine_type: n1-standard-1
- name: service_small
  cloud_properties:
    machine_type: n1-standard-1
- name: service_medium
  cloud_properties:
    machine_type: n1-standard-1
- name: service_medium_1CPU_2G
  cloud_properties:
    machine_type: n1-standard-1
- name: service_medium_2G
  cloud_properties:
    machine_type: n1-standard-2
- name: portal_tiny
  cloud_properties:
    machine_type: n1-standard-1
- name: portal_small
  cloud_properties:
    machine_type: n1-standard-1
- name: portal_medium
  cloud_properties:
    machine_type: n1-standard-1
- name: portal_large
  cloud_properties:
    machine_type: n1-standard-1

compilation:
  az: z3
  network: default
  reuse_compilation_vms: true
  vm_type: large
  workers: 5

disk_types:
- disk_size: 1024
  name: default
- disk_size: 1024
  name: 1GB
- disk_size: 2048
  name: 2GB
- disk_size: 4096
  name: 4GB
- disk_size: 5120
  name: 5GB
- disk_size: 8192
  name: 8GB
- disk_size: 10240
  name: 10GB
- disk_size: 20480
  name: 20GB
- disk_size: 30720
  name: 30GB
- disk_size: 51200
  name: 50GB
- disk_size: 102400
  name: 100GB
- disk_size: 1048576
  name: 1TB
- cloud_properties:
    type: SSD1 
  disk_size: 2000
  name: 2GB_GP2
- cloud_properties:
    type: SSD1 
  disk_size: 5000
  name: 5GB_GP2
- cloud_properties:
    type: SSD1 
  disk_size: 10000
  name: 10GB_GP2
- cloud_properties:
    type: SSD1 
  disk_size: 50000
  name: 50GB_GP2

networks:
- name: default
  subnets:
  - az: z1
    cloud_properties:
      name: random
      network_name: paasta-v50-vpc
      subnetwork_name: paasta-v50-private-subnet-1
      ephemeral_external_ip: false
      tags: [paasta-v50-security]
    dns:
    - 8.8.8.8
    gateway: 10.0.1.1
    range: 10.0.1.0/24
    reserved:
    - 10.0.1.2 - 10.0.1.9
    static:
    - 10.0.1.10 - 10.0.1.120
  - az: z2
    cloud_properties:
      name: random
      network_name: paasta-v50-vpc
      subnetwork_name: paasta-v50-private-subnet-2
      ephemeral_external_ip: false
      tags: [paasta-v50-security]
    dns:
    - 8.8.8.8
    gateway: 10.0.41.1
    range: 10.0.41.0/24
    reserved:
    - 10.0.41.2 - 10.0.41.9
    static:
    - 10.0.41.10 - 10.0.41.120
  - az: z3
    cloud_properties:
      name: random
      network_name: paasta-v50-vpc
      subnetwork_name: paasta-v50-private-subnet-3
      ephemeral_external_ip: false
      tags: [paasta-v50-security]
    dns:
    - 8.8.8.8
    gateway: 10.0.81.1
    range: 10.0.81.0/24
    reserved:
    - 10.0.81.2 - 10.0.81.9
    static:
    - 10.0.81.10 - 10.0.81.120
  - az: z4
    cloud_properties:
      name: random
      network_name: paasta-v50-vpc
      subnetwork_name: paasta-v50-private-subnet-4
      ephemeral_external_ip: false
      tags: [paasta-v50-security]
    dns:
    - 8.8.8.8
    gateway: 10.0.121.1
    range: 10.0.121.0/24
    reserved:
    - 10.0.121.2 - 10.0.121.9
    static:
    - 10.0.121.10 - 10.0.121.120
  - az: z5
    cloud_properties:
      name: random
      network_name: paasta-v50-vpc
      subnetwork_name: paasta-v50-private-subnet-5
      ephemeral_external_ip: false
      tags: [paasta-v50-security]
    dns:
    - 8.8.8.8
    gateway: 10.0.161.1
    range: 10.0.161.0/24
    reserved:
    - 10.0.161.2 - 10.0.161.9
    static:
    - 10.0.161.10 - 10.0.161.120
  - az: z6
    cloud_properties:
      name: random
      network_name: paasta-v50-vpc
      subnetwork_name: paasta-v50-private-subnet-6
      ephemeral_external_ip: false
      tags: [paasta-v50-security]
    dns:
    - 8.8.8.8
    gateway: 10.0.201.1
    range: 10.0.201.0/24
    reserved:
    - 10.0.201.2 - 10.0.201.9
    static:
    - 10.0.201.10 - 10.0.201.120
  - az: z7
    cloud_properties:
      name: random
      network_name: paasta-v50-vpc
      subnetwork_name: paasta-v50-public-subnet
      ephemeral_external_ip: false
      tags: [paasta-v50-security]
    dns:
    - 8.8.8.8
    gateway: 10.0.0.1
    range: 10.0.0.0/24
    reserved:
    - 10.0.0.2 - 10.0.0.9
    static:
    - 10.0.0.10 - 10.0.0.120
    
- name: vip 
  type: vip

vm_extensions:
- cloud_properties:
    ports:
    - host: 3306
  name: mysql-proxy-lb
- name: cf-router-network-properties
- name: cf-tcp-router-network-properties
- name: diego-ssh-proxy-network-properties
- name: cf-haproxy-network-properties 
- cloud_properties:
    ephemeral_disk:
      size: 51200
      type: gp2
  name: 50GB_ephemeral_disk
- cloud_properties:
    ephemeral_disk:
      size: 102400
      type: gp2
  name: 100GB_ephemeral_disk' > gcp-cloud-config.yml
  
echo 'azs:
- name: z1
  cloud_properties:
    availability_zone: nova
- name: z2
  cloud_properties:
    availability_zone: nova
- name: z3
  cloud_properties:
    availability_zone: nova
- name: z4
  cloud_properties:
    availability_zone: nova
- name: z5
  cloud_properties:
    availability_zone: nova
- name: z6
  cloud_properties:
    availability_zone: nova
- name: z7
  cloud_properties:
    availability_zone: nova

vm_types:
- name: minimal
  cloud_properties:
    instance_type: m1.small
- name: default 
  cloud_properties:
    instance_type: m1.medium
- name: small
  cloud_properties:
    instance_type: m1.small
- name: medium
  cloud_properties:
    instance_type: m1.medium
- name: medium-memory-8GB
  cloud_properties:
    instance_type: m1.medium
- name: large
  cloud_properties:
    instance_type: m1.large
- name: xlarge
  cloud_properties:
    instance_type: m1.xlarge
- name: small-50GB
  cloud_properties:
    instance_type: m1.medium
- name: small-50GB-ephemeral-disk 
  cloud_properties:
    instance_type: m1.medium
- name: small-100GB-ephemeral-disk
  cloud_properties:
    instance_type: m1.large
- name: small-highmem-100GB-ephemeral-disk 
  cloud_properties:
    instance_type: m1.large
- name: small-highmem-16GB
  cloud_properties:
    instance_type: m1.large
- name: service_medium
  cloud_properties:
    instance_type: m1.medium
- name: service_medium_2G
  cloud_properties:
    instance_type: m1.medium
- name: portal_small
  cloud_properties:
    instance_type: m1.small
- name: portal_medium
  cloud_properties:
    instance_type: m1.small
- name: portal_large
  cloud_properties:
    instance_type: m1.small

compilation:
  az: z3
  network: default
  reuse_compilation_vms: true
  vm_type: large
  workers: 5

disk_types:
- disk_size: 1024
  name: default
- disk_size: 1024
  name: 1GB
- disk_size: 2048
  name: 2GB
- disk_size: 4096
  name: 4GB
- disk_size: 5120
  name: 5GB
- disk_size: 8192
  name: 8GB
- disk_size: 10240
  name: 10GB
- disk_size: 20480
  name: 20GB
- disk_size: 30720
  name: 30GB
- disk_size: 51200
  name: 50GB
- disk_size: 102400
  name: 100GB
- disk_size: 1048576
  name: 1TB
- cloud_properties:
    type: SSD1 
  disk_size: 2000
  name: 2GB_GP2
- cloud_properties:
    type: SSD1 
  disk_size: 5000
  name: 5GB_GP2
- cloud_properties:
    type: SSD1 
  disk_size: 10000
  name: 10GB_GP2
- cloud_properties:
    type: SSD1 
  disk_size: 50000
  name: 50GB_GP2

networks:
- name: default
  subnets:
  - az: z1
    cloud_properties:
      name: random
      net_id: 657712d9-1948-4e6b-96fb-d6164a530dff
      security_groups:
      - paasta2
    dns:
    - 8.8.8.8
    gateway: 10.0.1.1
    range: 10.0.1.0/24
    reserved:
    - 10.0.1.1 - 10.0.1.9
    static:
    - 10.0.1.10 - 10.0.1.120
  - az: z2
    cloud_properties:
      name: random
      net_id: 657712d9-1948-4e6b-96fb-d6164a530dff
      security_groups:
      - paasta2
    dns:
    - 8.8.8.8
    gateway: 10.0.41.1
    range: 10.0.41.0/24
    reserved:
    - 10.0.41.1 - 10.0.41.9
    static:
    - 10.0.41.10 - 10.0.41.120
  - az: z3
    cloud_properties:
      name: random
      net_id: 657712d9-1948-4e6b-96fb-d6164a530dff
      security_groups:
      - paasta2
    dns:
    - 8.8.8.8
    gateway: 10.0.81.1
    range: 10.0.81.0/24
    reserved:
    - 10.0.81.1 - 10.0.81.9
    static:
    - 10.0.81.10 - 10.0.81.120
  - az: z4
    cloud_properties:
      name: random
      net_id: 657712d9-1948-4e6b-96fb-d6164a530dff
      security_groups:
      - paasta2
    dns:
    - 8.8.8.8
    gateway: 10.0.121.1
    range: 10.0.121.0/24
    reserved:
    - 10.0.121.1 - 10.0.121.9
    static:
    - 10.0.121.10 - 10.0.121.120
  - az: z5
    cloud_properties:
      name: random
      net_id: 657712d9-1948-4e6b-96fb-d6164a530dff
      security_groups:
      - paasta2
    dns:
    - 8.8.8.8
    gateway: 10.0.161.1
    range: 10.0.161.0/24
    reserved:
    - 10.0.161.1 - 10.0.161.9
    static:
    - 10.0.161.10 - 10.0.161.120
  - az: z6
    cloud_properties:
      name: random
      net_id: 657712d9-1948-4e6b-96fb-d6164a530dff
      security_groups:
      - paasta2
    dns:
    - 8.8.8.8
    gateway: 10.0.201.1
    range: 10.0.201.0/24
    reserved:
    - 10.0.201.1 - 10.0.201.9
    static:
    - 10.0.201.10 - 10.0.201.120
  - az: z7
    cloud_properties:
      name: random
      net_id: 657712d9-1948-4e6b-96fb-d6164a530dff
      security_groups:
      - paasta2
    dns:
    - 8.8.8.8
    gateway: 10.0.0.1
    range: 10.0.0.0/24
    reserved:
    - 10.0.0.1 - 10.0.0.9
    static:
    - 10.0.0.10 - 10.0.0.120
  
- name: vip 
  type: vip

vm_extensions:
- cloud_properties:
    ports:
    - host: 3306
  name: mysql-proxy-lb
- name: cf-router-network-properties
- name: cf-tcp-router-network-properties
- name: diego-ssh-proxy-network-properties
- name: cf-haproxy-network-properties 
- cloud_properties:
    ephemeral_disk:
      size: 51200
      type: gp2
  name: small-50GB 
- cloud_properties:
    ephemeral_disk:
      size: 102400
      type: gp2
  name: small-highmem-100GB ' > openstack-cloud-config.yml

echo 'azs:
- name: z1
  cloud_properties:
    datacenters:
    - clusters:
      - BD-HA:
          resource_pool: BOSH2_PAASTA_40_Pools
      name: BD-HA
- name: z2
  cloud_properties:
    datacenters:
    - clusters:
      - BD-HA:
          resource_pool: BOSH2_PAASTA_40_Pools
      name: BD-HA
- name: z3
  cloud_properties:
    datacenters:
    - clusters:
      - BD-HA:
          resource_pool: BOSH2_PAASTA_40_Pools
      name: BD-HA
- name: z4
  cloud_properties:
    datacenters:
    - clusters:
      - BD-HA:
          resource_pool: BOSH2_PAASTA_40_Pools
      name: BD-HA
- name: z5
  cloud_properties:
    datacenters:
    - clusters:
      - BD-HA:
          resource_pool: BOSH2_PAASTA_40_Pools
      name: BD-HA
- name: z6
  cloud_properties:
    datacenters:
    - clusters:
      - BD-HA:
          resource_pool: BOSH2_PAASTA_40_Pools
      name: BD-HA
- name: z7
  cloud_properties:
    datacenters:
    - clusters:
      - BD-HA:
          resource_pool: BOSH2_PAASTA_40_Pools
      name: BD-HA

vm_types:
- name: minimal
  cloud_properties:
    cpu: 1
    ram: 1024
    disk: 8192
- name: default
  cloud_properties:
    cpu: 1
    ram: 2048
    disk: 10240
- name: small
  cloud_properties:
    cpu: 1
    ram: 4096
    disk: 20480	#30720
- name: medium
  cloud_properties:
    cpu: 2
    ram: 4096
    disk: 20480
- name: medium-memory-8GB
  cloud_properties:
    cpu: 2
    ram: 8192
    disk: 20480
- name: large
  cloud_properties:
    cpu: 4
    ram: 8192
    disk: 20480
- name: xlarge
  cloud_properties:
    cpu: 8
    ram: 16384
    disk: 20480
- name: small-50GB
  cloud_properties:
    cpu: 2
    ram: 4096
    disk: 51200
- name: small-50GB-ephemeral-disk
  cloud_properties:
    cpu: 2
    ram: 4096
    disk: 51200
- name: small-100GB-ephemeral-disk
  cloud_properties:
    cpu: 4
    ram: 8192
    disk: 102400
- name: small-highmem-100GB-ephemeral-disk
  cloud_properties:
    cpu: 4
    ram: 8192
    disk: 102400
- name: small-highmem-16GB
  cloud_properties:
    cpu: 8
    ram: 16384
    disk: 20480
- name: service_tiny
  cloud_properties:
    cpu: 1
    ram: 256
    disk: 4096
- name: service_small
  cloud_properties:
    cpu: 1
    ram: 512
    disk: 4096
- name: service_medium
  cloud_properties:
    cpu: 1
    ram: 1024
    disk: 4096
- name: service_medium_1CPU_2G
  cloud_properties:
    cpu: 1
    ram: 2048
    disk: 4096
- name: service_medium_4G
  cloud_properties:
    cpu: 2
    ram: 4096
    disk: 8192
- name: service_medium_2G
  cloud_properties:
    cpu: 2
    ram: 2048
    disk: 10240
- name: portal_tiny
  cloud_properties:
    cpu: 1
    ram: 256
    disk: 4096
- name: portal_small
  cloud_properties:
    cpu: 1
    ram: 512
    disk: 4096
- name: portal_medium
  cloud_properties:
    cpu: 1
    ram: 1024
    disk: 4096
- name: portal_large
  cloud_properties:
    cpu: 1
    ram: 2048
    disk: 4096

compilation:
  az: z1
  network: default
  reuse_compilation_vms: true
  vm_type: large
  workers: 5

disk_types:
- disk_size: 1024
  name: default
- disk_size: 1024
  name: 1GB
- disk_size: 2048
  name: 2GB
- disk_size: 4096
  name: 4GB
- disk_size: 5120
  name: 5GB
- disk_size: 8192
  name: 8GB
- disk_size: 10240
  name: 10GB
- disk_size: 20480
  name: 20GB
- disk_size: 30720
  name: 30GB
- disk_size: 51200
  name: 50GB
- disk_size: 102400
  name: 100GB
- disk_size: 1048576
  name: 1TB

networks:
- name: default
  subnets:
  - azs: [z1,z2,z3,z4,z5,z6,z7]
    gateway: 10.30.20.23
    dns: [8.8.8.8]
    range: 10.30.0.0/16
    reserved: 
      - 10.30.0.0 - 10.30.30.255
      - 10.30.50.0 - 10.30.255.255
    cloud_properties:
      name: "Internal"

- name: public
  type: manual
  subnets:
  - azs: [z1,z2,z3,z4,z5,z6,z7]
    gateway: 115.68.46.177
    dns: [8.8.8.8]
    range: 115.68.46.176/28
    reserved: 
      - 115.68.46.176 - 115.68.46.180
      - 115.68.46.188 - 115.68.46.190
    cloud_properties:
      name: "External"
    static:
    - 115.68.46.181 - 115.68.46.185

- name: service_private
  subnets:
  - azs: [z1,z2,z3,z4,z5,z6,z7]
    gateway: 10.30.20.23
    dns: [8.8.8.8]
    range: 10.30.0.0/16
    reserved:
      - 10.30.0.0 - 10.30.21.255
      - 10.30.40.0 - 10.30.255.255
    cloud_properties:
      name: "Internal"
    static:
    - 10.30.22.0 - 10.30.30.255

- name: service_public
  type: manual
  subnets:
  - azs: [z1,z2,z3,z4,z5,z6,z7]
    gateway: 115.68.47.161
    dns: [8.8.8.8]
    range: 115.68.47.160/24
    reserved: 
      - 115.68.47.160 - 115.68.47.164
      - 115.68.47.172 - 115.68.47.185
    cloud_properties:
      name: "External"
    static:
    - 115.68.47.165 - 115.68.47.171
    - 115.68.47.186 - 115.68.47.190

- name: portal_service_public
  type: manual
  subnets:
  - azs: [z1,z2,z3,z4,z5,z6,z7]
    gateway: 115.68.46.209
    dns: [8.8.8.8]
    range: 115.68.46.208/28
    reserved: 
      - 115.68.46.217 - 115.68.46.222
    cloud_properties:
      name: "External"
    static:
    - 115.68.46.213 - 115.68.46.215

vm_extensions:
- cloud_properties:
    ports:
    - host: 3306
  name: mysql-proxy-lb
- name: cf-router-network-properties
- name: cf-tcp-router-network-properties
- name: diego-ssh-proxy-network-properties
- name: cf-haproxy-network-properties
- name: 50GB_ephemeral_disk
  cloud_properties:
    disk: 51200
- name: 100GB_ephemeral_disk
  cloud_properties:
    disk: 102400' > vsphere-cloud-config.yml




