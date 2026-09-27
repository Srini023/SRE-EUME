Here are the ready-to-run CLI commands you’ll need to create the backend resources before running terraform init with your backend.tf.

🟦 AWS — S3 Bucket + DynamoDB Table

# Create S3 bucket for state storage
aws s3api create-bucket \
  --bucket my-terraform-state-bucket \
  --region ap-south-1 \
  --create-bucket-configuration LocationConstraint=ap-south-1

# Enable versioning (recommended for state recovery)
aws s3api put-bucket-versioning \
  --bucket my-terraform-state-bucket \
  --versioning-configuration Status=Enabled

# Create DynamoDB table for state locking
aws dynamodb create-table \
  --table-name terraform-locks \
  --attribute-definitions AttributeName=LockID,AttributeType=S \
  --key-schema AttributeName=LockID,KeyType=HASH \
  --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 \
  --region ap-south-1


🟥 GCP — GCS Bucket

# Create GCS bucket for state storage
gsutil mb -p <PROJECT_ID> -c standard -l us-central1 gs://my-terraform-state-bucket/

# Enable versioning (recommended for state recovery)
gsutil versioning set on gs://my-terraform-state-bucket/

🚀 Next Steps
Replace <PROJECT_ID> with your actual GCP project ID.

Run these commands once to provision the backend resources.

Then run:

terraform init -reconfigure
to migrate your local state into the remote backend.

This setup ensures safe, centralized state management with locking (AWS DynamoDB) and versioning (S3/GCS).


