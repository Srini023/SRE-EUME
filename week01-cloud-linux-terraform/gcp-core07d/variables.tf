variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "machine_type" {
  description = "GCE machine type"
  type        = string
  default     = "e2-medium"
}

variable "image" {
  description = "OS image for the VM"
  type        = string
  default     = "debian-cloud/debian-11"
}

variable "alert_email" {
  description = "Email address to receive monitoring alerts"
  type        = string
}

variable "dns_zone_name" {
  description = "Name of the Cloud DNS managed zone"
  type        = string
}

variable "domain_name" {
  description = "Domain name to map to the load balancer"
  type        = string
}

variable "regions" {
  description = "Regions for multi-region deployment"
  type        = list(string)
}

