terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket"   # pre-created S3 bucket
    key            = "env/dev/terraform.tfstate"   # path inside bucket
    region         = "ap-south-1"
    dynamodb_table = "terraform-locks"             # pre-created DynamoDB table
    encrypt        = true
  }
}

#Notes:
#Bucket: must exist before running terraform init.

#DynamoDB table: must exist with a primary key LockID (string).

#Enables state locking to prevent concurrent apply.
