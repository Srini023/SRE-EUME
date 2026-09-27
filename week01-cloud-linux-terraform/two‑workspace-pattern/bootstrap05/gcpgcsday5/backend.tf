terraform {
  backend "gcs" {
    bucket      = "my-terraform-state-bucket"   # pre-created GCS bucket
    prefix      = "env/dev"                     # folder-like prefix
  }
}


#Notes:
#Bucket: must exist in your GCP project.

#Terraform will store state files under env/dev/terraform.tfstate.
