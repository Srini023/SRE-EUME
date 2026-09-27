output "aws_ec2_ip" {
  value       = module.aws_ec2.ec2_public_ip
  description = "Public IP of AWS EC2"
}

output "gcp_vm_ip" {
  value       = module.gcp_vm.gcp_instance_ip
  description = "Public IP of GCP VM"
}

