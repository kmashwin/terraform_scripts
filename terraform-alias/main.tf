provider "aws" {
  region = "ap-south-1"
}

provider "aws" {
  alias  = "ohio"
  region = "us-east-2"
}

resource "aws_instance" "mum-instance" {
  ami           = var.ami-redhat
  instance_type = var.aws-micro
  key_name      = "devops"
  tags = {
    Name = "mum-ec2-1"
  }
}

resource "aws_instance" "ohio-instance" {
  provider      = aws.ohio
  ami           = var.ami-ubuntu-ohio
  instance_type = var.aws-micro
  key_name      = "ohio"
  tags = {
    Name = "ohio-ec2-1"
  }
}
