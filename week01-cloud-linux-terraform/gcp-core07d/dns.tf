resource "google_dns_managed_zone" "dns_zone" {
  name        = var.dns_zone_name
  dns_name    = "${var.domain_name}."
  description = "Managed zone for ${var.domain_name}"
}

resource "google_dns_record_set" "dns_record" {
  name         = "${var.domain_name}."
  type         = "A"
  ttl          = 300
  managed_zone = google_dns_managed_zone.dns_zone.name

  rrdatas = [google_compute_global_address.lb_ip.address]
}

