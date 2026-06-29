terraform {
  backend "s3" {
    bucket         = "demo-tf-statefile-bucket-93"
    key            = "ec2/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "Terraform-stateFile-Lock"
  }
}

resource "aws_instance" "ec2-instance" {
    count = 1
    ami = var.ami
    instance_type = var.instance_type
    key_name = var.key_name
    vpc_security_group_ids = ["sg-07c5f31dca02f8784"]
    associate_public_ip_address = true
    tags = {
        name = "Terraform-EC2-{count.index +1}-Linux"
    }
}