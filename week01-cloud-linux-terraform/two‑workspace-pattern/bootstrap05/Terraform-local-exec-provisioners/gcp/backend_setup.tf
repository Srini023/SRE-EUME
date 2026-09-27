resource "null_resource" "gcp_backend" {
  provisioner "local-exec" {
    command = <<EOT
      gsutil mb -p your-project-id -c standard -l us-central1 gs://my-terraform-state-bucket/
      gsutil versioning set on gs://my-terraform-state-bucket/
    EOT
    interpreter = ["/bin/bash", "-c"]
  }
}

