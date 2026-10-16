# Define Local Values in Terraform
locals {
  owners = "Demo"
  environment = var.environment
  name = "Demo-${var.environment}"
  common_tags = {
    owners = local.owners
    environment = local.environment
  }
  eks_cluster_name = "${data.terraform_remote_state.eks.outputs.eks_cluster_id}"  
} 
