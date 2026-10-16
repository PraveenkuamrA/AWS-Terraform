data "terraform_remote_state" "eks_cluster" {
  backend = "s3"

  config = {
    bucket = "tfstate-dev-us-east-1-praveen-statefile1"     # Name of the remote S3 bucket where the EKS state is stored
    key    = "eks/dev/terraform.tfstate"        # Path to the VPC tfstate file within the bucket
    region = var.aws_region                    # Region where the S3 bucket

  }
}
#-----------------------------------------------------------------------

