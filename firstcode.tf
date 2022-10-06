provider "aws" {
  profile = "default"
  region  = "us-east-1"
}


data "aws_caller_identity" "current" {}

data "aws_vpc" "lz_vpc" {
  tags = {
    Name = "kaush-vpc"
  }
}

data "aws_subnet" "my_subnet" {
  vpc_id = data.aws_vpc.lz_vpc.id
//  cidr_block = "10.1.1.0/24"
  filter {
    name = "tag:Name"
    values = ["Kaush-pub1"]
  }
}

# //////////////////////////////
# OUTPUT
# //////////////////////////////
output "account_id" {
  value = data.aws_caller_identity.current.account_id
}

output "caller_arn" {
  value = data.aws_caller_identity.current.arn
}

output "caller_user" {
  value = data.aws_caller_identity.current.user_id
}

output "vpc_id" {
  value = data.aws_vpc.lz_vpc.id
}

output "subnet_id" {
  value = data.aws_subnet.my_subnet.id
}
