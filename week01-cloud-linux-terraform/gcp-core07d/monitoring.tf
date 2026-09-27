resource "google_monitoring_notification_channel" "email_channel" {
  display_name = "Email Alerts"
  type         = "email"
  labels = {
    email_address = var.alert_email
  }
}

resource "google_monitoring_alert_policy" "cpu_alert" {
  display_name = "High CPU Usage Alert"
  combiner     = "OR"

  conditions {
    display_name = "VM CPU > 80%"
    condition_threshold {
      filter          = "metric.type=\"compute.googleapis.com/instance/cpu/utilization\" resource.type=\"gce_instance\""
      comparison      = "COMPARISON_GT"
      threshold_value = 0.8
      duration        = "300s"
      trigger { count = 1 }
    }
  }

  notification_channels = [google_monitoring_notification_channel.email_channel.id]
}

resource "google_monitoring_alert_policy" "disk_alert" {
  display_name = "High Disk Usage Alert"
  combiner     = "OR"

  conditions {
    display_name = "VM Disk > 90%"
    condition_threshold {
      filter          = "metric.type=\"agent.googleapis.com/disk/percent_used\" resource.type=\"gce_instance\""
      comparison      = "COMPARISON_GT"
      threshold_value = 90
      duration        = "300s"
      trigger { count = 1 }
    }
  }

  notification_channels = [google_monitoring_notification_channel.email_channel.id]
}

resource "google_monitoring_alert_policy" "memory_alert" {
  display_name = "High Memory Usage Alert"
  combiner     = "OR"

  conditions {
    display_name = "VM Memory > 80%"
    condition_threshold {
      filter          = "metric.type=\"agent.googleapis.com/memory/percent_used\" resource.type=\"gce_instance\""
      comparison      = "COMPARISON_GT"
      threshold_value = 80
      duration        = "300s"
      trigger { count = 1 }
    }
  }

  notification_channels = [google_monitoring_notification_channel.email_channel.id]
}

