variable "region" {
    default = "ap-south-1"
  
}

variable "instance_type" {
  default = "t3.micro"
}

variable "ami" {
  description = "Amazon Linux 2 AMI"
}

variable "key_name" {
  description = "EC2 key pair"
}

#ami = "ami-048f4445314bcaa09"