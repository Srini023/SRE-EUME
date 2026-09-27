output "service_account_email" {
  value = google_service_account.vm_sa.email
}

output "instance_groups" {
  value = [for r, g in google_compute_instance_group_manager.vm_group : g.name]
}

output "autoscalers" {
  value = [for r, a in google_compute_autoscaler.vm_autoscaler : a.name]
}

output "load_balancer_ip" {
  value = google_compute_global_address.lb_ip.address
}

output "dns_record" {
  value = google_dns_record_set.dns_record.name
}

output "alert_policy_cpu" {
  value = google_monitoring_alert_policy.cpu_alert.display_name
}

output "alert_policy_disk" {
  value = google_monitoring_alert_policy.disk_alert.display_name
}

output "alert_policy_memory" {
  value = google_monitoring_alert_policy.memory_alert.display_name
}

