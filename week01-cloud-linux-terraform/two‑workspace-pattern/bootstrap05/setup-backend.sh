#!/bin/bash
set -e

AWS_REGION="ap-south-1"
AWS_BUCKET="my-terraform-state-bucket"
DDB_TABLE="terraform-locks"
GCP_BUCKET="my-terraform-state-bucket"
GCP_PROJECT_ID="your-project-id"
GCP_REGION="us-central1"

create_aws_backend() {
  echo "Creating AWS S3 bucket..."
  aws s3api create-bucket \
    --bucket $AWS_BUCKET \
    --region $AWS_REGION \
    --create-bucket-configuration LocationConstraint=$AWS_REGION

  echo "Enabling versioning..."
  aws s3api put-bucket-versioning \
    --bucket $AWS_BUCKET \
    --versioning-configuration Status=Enabled

  echo "Creating DynamoDB table..."
  aws dynamodb create-table \
    --table-name $DDB_TABLE \
    --attribute-definitions AttributeName=LockID,AttributeType=S \
    --key-schema AttributeName=LockID,KeyType=HASH \
    --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 \
    --region $AWS_REGION
}

create_gcp_backend() {
  echo "Creating GCS bucket..."
  gsutil mb -p $GCP_PROJECT_ID -c standard -l $GCP_REGION gs://$GCP_BUCKET/

  echo "Enabling versioning..."
  gsutil versioning set on gs://$GCP_BUCKET
}

case "$1" in
  aws) create_aws_backend ;;
  gcp) create_gcp_backend ;;
  *) echo "Usage: $0 {aws|gcp}" ;;
esac


#Run:
#chmod +x setup-backend.sh
#./setup-backend.sh aws
#or
#./setup-backend.sh gcp
