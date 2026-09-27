#Multi‑Region MIGs + Autoscaler

variable "regions" {
  description = "Regions for multi-region deployment"
  type        = list(string)
}

resource "google_service_account" "vm_sa" {
  account_id   = "multi-region-sa"
  display_name = "Service Account for multi-region MIGs"
}

resource "google_compute_instance_template" "vm_template" {
  name         = "multi-region-template"
  machine_type = var.machine_type

  disk {
    auto_delete  = true
    boot         = true
    source_image = var.image
  }

  network_interface {
    network       = "default"
    access_config {}
  }

  service_account {
    email  = google_service_account.vm_sa.email
    scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }

  metadata_startup_script = <<-EOT
    #!/bin/bash
    apt-get update -y
    curl -sSO https://dl.google.com/cloudagents/add-google-cloud-ops-agent-repo.sh
    bash add-google-cloud-ops-agent-repo.sh --also-install
    systemctl enable google-cloud-ops-agent
    systemctl start google-cloud-ops-agent
  EOT
}

resource "google_compute_instance_group_manager" "vm_group" {
  for_each           = toset(var.regions)
  name               = "mig-${each.key}"
  base_instance_name = "vm-${each.key}"
  region             = each.key

  version {
    instance_template = google_compute_instance_template.vm_template.id
  }

  target_size = 1
}

resource "google_compute_autoscaler" "vm_autoscaler" {
  for_each = toset(var.regions)
  name     = "autoscaler-${each.key}"
  region   = each.key
  target   = google_compute_instance_group_manager.vm_group[each.key].id

  autoscaling_policy {
    min_replicas    = 1
    max_replicas    = 5
    cpu_utilization {
      target = 0.7
    }
  }
}

