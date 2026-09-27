output "ec2_public_ip" {
  value = aws_instance.example.public_ip
}

output "s3_bucket_name" {
  value = aws_s3_bucket.example.bucket
}

output "iam_role_name" {
  value = aws_iam_role.ec2_role.name
}

