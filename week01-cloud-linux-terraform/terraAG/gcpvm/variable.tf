variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "GCP zone"
  type        = string
  default     = "us-central1-a"
}

variable "machine_type" {
  description = "VM machine type"
  type        = string
  default     = "e2-micro"
}

variable "image" {
  description = "OS image for VM"
  type        = string
  default     = "debian-cloud/debian-11"
}

variable "instance_name" {
  description = "Name of VM instance"
  type        = string
  default     = "terraform-gcp-vm"
}

