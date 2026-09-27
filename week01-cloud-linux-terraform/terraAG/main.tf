# Choose which module to use by commenting/uncommenting

module "aws_ec2" {
  source        = "./aws-ec2"
  region        = var.aws_region
  ami_id        = var.aws_ami_id
  instance_type = var.aws_instance_type
  key_name      = var.aws_key_name
  instance_name = var.aws_instance_name
}

module "gcp_vm" {
  source        = "./gcp-vm"
  project_id    = var.gcp_project_id
  region        = var.gcp_region
  zone          = var.gcp_zone
  machine_type  = var.gcp_machine_type
  image         = var.gcp_image
  instance_name = var.gcp_instance_name
}

