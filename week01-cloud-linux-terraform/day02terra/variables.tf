variable "aws_region" {
  type        = string
  description = "AWS region"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block for VPC"
}

variable "public_subnet_cidr" {
  type        = string
  description = "CIDR block for public subnet"
}

variable "private_subnet_cidr" {
  type        = string
  description = "CIDR block for private subnet"
}

