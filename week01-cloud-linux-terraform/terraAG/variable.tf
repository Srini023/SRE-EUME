# AWS variables
variable "aws_region" { default = "ap-south-1" }
variable "aws_ami_id" {}
variable "aws_instance_type" { default = "t2.micro" }
variable "aws_key_name" {}
variable "aws_instance_name" { default = "terraform-ec2" }

# GCP variables
variable "gcp_project_id" {}
variable "gcp_region" { default = "us-central1" }
variable "gcp_zone" { default = "us-central1-a" }
variable "gcp_machine_type" { default = "e2-micro" }
variable "gcp_image" { default = "debian-cloud/debian-11" }
variable "gcp_instance_name" { default = "terraform-gcp-vm" }

