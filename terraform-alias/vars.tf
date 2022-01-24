variable "aws-micro" {
  description = "Set the server based on the requirement"
  default     = "t2.micro"
}

variable "region" {
  description = "Set the aws provider based on the requirement"
  default     = "ap-south-1"
}

variable "ami-redhat" {
  description = "Set the ami based on the requirement"
  default     = "ami-06a0b4e3b7eb7a300"
}

variable "ami-ubuntu" {
  description = "Set the ami based on the requirement"
  default     = "ami-0851b76e8b1bce90b"
}

variable "ami-ubuntu-ohio" {
  description = "Set the ami based on the requirement"
  default     = "ami-0fb653ca2d3203ac1"
}

variable "name" {
  description = "Set the name for ec2 based on the requirement"
  default     = "ec2"
}

