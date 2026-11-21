data "terraform_remote_state" "eks" {
  backend = "s3"

  config = {
    bucket = "tfstate-dev-us-east-1-praveen-statefile1"     # Name of the remote S3 bucket where the EKS state is stored
    key    = "eks/dev/terraform.tfstate"        # Path to the EKS tfstate file within the bucket
    region = var.aws_region                    # Region where the S3 bucket
  }
}

#-------------------------------------------------
# OIDC statefile 

data "terraform_remote_state" "OIDC" {
  backend = "s3"

  config = {
    bucket = "tfstate-dev-us-east-1-praveen-statefile1"     # Name of the remote S3 bucket where the OIDC state is stored
    key    = "OIDC/dev/terraform.tfstate"        # Path to the oidc tfstate file within the bucket
    region = var.aws_region                    # Region where the S3 bucket
  }
}
