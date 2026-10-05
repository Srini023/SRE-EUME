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
# VPC Network (Custom Mode)
############################################################
resource "google_compute_network" "main" {
  name                    = "sre-gcp-vpc"
  auto_create_subnetworks = false
  routing_mode            = "GLOBAL"

  # Keep default internet route (needed for Cloud NAT)
  delete_default_routes_on_create = false
}

############################################################
# Subnets
############################################################

resource "google_compute_subnetwork" "public" {
  name          = "public-subnet"
  ip_cidr_range = "10.0.1.0/24"
  region        = var.region
  network       = google_compute_network.main.id

  private_ip_google_access = true
}

resource "google_compute_subnetwork" "private" {
  name          = "private-subnet"
  ip_cidr_range = "10.0.2.0/24"
  region        = var.region
  network       = google_compute_network.main.id

  private_ip_google_access = true
}

############################################################
# Firewall Rules
############################################################

# Allow SSH only from your IP
resource "google_compute_firewall" "allow_ssh" {
  name    = "allow-ssh"
  network = google_compute_network.main.name

  allows {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = [var.my_ip]
}

# Allow internal communication
resource "google_compute_firewall" "internal" {
  name    = "allow-internal"
  network = google_compute_network.main.name

  allows {
    protocol = "all"
  }

  source_ranges = ["10.0.0.0/16"]
}

############################################################
# Cloud Router + Cloud NAT (for private subnet)
############################################################

resource "google_compute_router" "router" {
  name    = "sre-router"
  region  = var.region
  network = google_compute_network.main.id
}

resource "google_compute_router_nat" "nat" {
  name                               = "sre-nat"
  router                             = google_compute_router.router.name
  region                             = var.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"

  subnetwork {
    name                    = google_compute_subnetwork.private.name
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }
}

############################################################
# Outputs
############################################################

output "vpc_name" {
  value = google_compute_network.main.name
}

output "public_subnet" {
  value = google_compute_subnetwork.public.ip_cidr_range
}

output "private_subnet" {
  value = google_compute_subnetwork.private.ip_cidr_range
}

