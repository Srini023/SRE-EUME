variable "project_id" {
  type        = string
  description = "GCP project ID"
}

variable "region" {
  type        = string
  description = "GCP region"
}

variable "network_name" {
  type        = string
  description = "Name of the VPC network"
}

variable "public_subnet_cidr" {
  type        = string
  description = "CIDR for public subnet"
}

variable "private_subnet_cidr" {
  type        = string
  description = "CIDR for private subnet"
}

