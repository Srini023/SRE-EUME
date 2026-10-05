############################################################
# Provider
############################################################
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 6.0.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

############################################################
# VPC + Subnets (from Day 18)
############################################################
# If already created, reuse:
# module.vpc.network_name
# module.vpc.subnets

module "vpc" {
  source  = "terraform-google-modules/network/google"
  version = "~> 9.0"

  project_id   = var.project_id
  network_name = "sre-gcp-vpc"

  subnets = [
    {
      subnet_name   = "gke-subnet"
      subnet_ip     = "10.10.0.0/24"
      subnet_region = var.region
    }
  ]
}

############################################################
# GKE Cluster
############################################################
module "gke" {
  source  = "terraform-google-modules/kubernetes-engine/google"
  version = "~> 30.0"

  project_id = var.project_id
  name       = "sre-gke"
  region     = var.region

  network    = module.vpc.network_name
  subnetwork = "gke-subnet"

  ##########################################################
  # Private Cluster
  ##########################################################
  ip_range_pods     = "pods-range"
  ip_range_services = "services-range"

  create_subnetworks = false
  enable_private_nodes = true
  enable_private_endpoint = false

  ##########################################################
  # Node Pool
  ##########################################################
  node_pools = [
    {
      name               = "default-pool"
      machine_type       = "e2-medium"
      min_count          = 2
      max_count          = 5
      auto_repair        = true
      auto_upgrade       = true
      disk_size_gb       = 50
      disk_type          = "pd-standard"
    }
  ]

  ##########################################################
  # Release Channel
  ##########################################################
  release_channel = "REGULAR"
}

############################################################
# Outputs
############################################################
output "gke_name" {
  value = module.gke.name
}

output "gke_endpoint" {
  value = module.gke.endpoint
}

output "gke_ca_cert" {
  value = module.gke.ca_certificate
}

