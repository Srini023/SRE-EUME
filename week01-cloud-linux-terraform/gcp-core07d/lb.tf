resource "google_compute_health_check" "http_health" {
  name               = "multi-region-hc"
  check_interval_sec = 10
  timeout_sec        = 5
  healthy_threshold  = 2
  unhealthy_threshold= 2

  http_health_check {
    port = 80
  }
}

resource "google_compute_backend_service" "backend" {
  name                  = "multi-region-backend"
  protocol              = "HTTP"
  port_name             = "http"
  timeout_sec           = 10
  load_balancing_scheme = "EXTERNAL"
  health_checks         = [google_compute_health_check.http_health.id]

  dynamic "backend" {
    for_each = google_compute_instance_group_manager.vm_group
    content {
      group = backend.value.instance_group
    }
  }
}

resource "google_compute_url_map" "url_map" {
  name            = "multi-region-urlmap"
  default_service = google_compute_backend_service.backend.id
}

resource "google_compute_managed_ssl_certificate" "https_cert" {
  name = "multi-region-cert"
  managed {
    domains = [var.domain_name]
  }
}

resource "google_compute_target_https_proxy" "https_proxy" {
  name             = "multi-region-https-proxy"
  url_map          = google_compute_url_map.url_map.id
  ssl_certificates = [google_compute_managed_ssl_certificate.https_cert.id]
}

resource "google_compute_global_address" "lb_ip" {
  name = "multi-region-ip"
}

resource "google_compute_global_forwarding_rule" "https_rule" {
  name                  = "multi-region-https-fwd"
  ip_address            = google_compute_global_address.lb_ip.address
  ip_protocol           = "TCP"
  port_range            = "443"
  load_balancing_scheme = "EXTERNAL"
  target                = google_compute_target_https_proxy.https_proxy.id
}

