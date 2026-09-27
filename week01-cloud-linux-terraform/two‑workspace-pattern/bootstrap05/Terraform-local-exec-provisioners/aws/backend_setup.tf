resource "null_resource" "aws_backend" {
  provisioner "local-exec" {
    command = <<EOT
      aws s3api create-bucket \
        --bucket my-terraform-state-bucket \
        --region ap-south-1 \
        --create-bucket-configuration LocationConstraint=ap-south-1

      aws s3api put-bucket-versioning \
        --bucket my-terraform-state-bucket \
        --versioning-configuration Status=Enabled

      aws dynamodb create-table \
        --table-name terraform-locks \
        --attribute-definitions AttributeName=LockID,AttributeType=S \
        --key-schema AttributeName=LockID,KeyType=HASH \
        --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 \
        --region ap-south-1
    EOT
    interpreter = ["/bin/bash", "-c"]
  }
}

