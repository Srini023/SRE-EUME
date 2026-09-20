output "vpc_name" {
  value = google_compute_network.vpc.name
}

output "public_subnet" {
  value = google_compute_subnetwork.public.name
}

output "private_subnet" {
  value = google_compute_subnetwork.private.name
}

output "router_name" {
  value = google_compute_router.router.name
}

output "nat_name" {
  value = google_compute_router_nat.nat.name
}

