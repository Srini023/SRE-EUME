Place these snippets in your root module alongside backend.tf.

Run:

terraform init
terraform apply

→ Terraform will execute the local-exec commands to provision backend resources before you migrate state.

Replace your-project-id and bucket/table names with your actual values.

These null_resource blocks don’t manage the lifecycle of the backend resources (Terraform won’t track changes to them). They’re just a bootstrap step.

👉 This approach is handy for one‑time setup automation
