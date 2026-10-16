# Terraform AWS Provider Block

data "aws_eks_cluster" "cluster" {
  name = data.terraform_remote_state.eks.outputs.eks_cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = data.terraform_remote_state.eks.outputs.eks_cluster_id
}

# Terraform Kubernetes Provider
provider "kubernetes" {
  host = data.terraform_remote_state.eks.outputs.eks_cluster_endpoint 
  cluster_ca_certificate = base64decode(data.terraform_remote_state.eks.outputs.eks_cluster_certificate_authority_data)
  token = data.aws_eks_cluster_auth.cluster.token
}
