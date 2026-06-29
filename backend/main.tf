
resource "aws_s3_bucket" "S3_statefile" {
    bucket = "demo-tf-statefile-bucket-93"
    lifecycle {
      prevent_destroy = false
    }
  
}

resource "aws_dynamodb_table" "Dynamo-table" {
    name = "Terraform-stateFile-Lock"
    billing_mode = "PAY_PER_REQUEST"
    hash_key = "LockID"

    attribute {
      name = "LockID"
      type = "S"
    }
}