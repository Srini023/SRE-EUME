🚀 Workflow
Create backend resources first:

AWS: aws s3api create-bucket ... and aws dynamodb create-table ...

GCP: gsutil mb gs://my-terraform-state-bucket

Add the backend.tf file to your root module.
Run:
terraform init -reconfigure
to migrate local state to remote.

👉 This gives you a production-ready remote state setup for both AWS and GCP.
