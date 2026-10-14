# AWS Region and Environment
aws_region = "us-east-1"
environment_name = "staging"
business_division = "retail"

# EKS Cluster 
cluster_name = "eksdemo1"
cluster_service_ipv4_cidr = "172.21.0.0/16"
cluster_version = "1.33"

# EKS Cluster Access Control
cluster_endpoint_private_access = true
cluster_endpoint_public_access = false
cluster_endpoint_public_access_cidrs = ["10.0.0.0/8"]

# EKS Node Group Configuration
node_instance_types = ["t3.large"]
node_capacity_type  = "SPOT"
node_disk_size      = 30