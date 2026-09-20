Architecture Diagram

VPC: 10.0.0.0/16
 ├── Public Subnet: 10.0.1.0/24
 │     ├── NAT Gateway (EIP)
 │     ├── Internet Gateway
 │     └── Route: 0.0.0.0/0 → IGW
 │
 └── Private Subnet: 10.0.2.0/24
       ├── EC2 (no public IP)
       └── Route: 0.0.0.0/0 → NAT Gateway
What This Project Demonstrates to Recruiters
You understand CIDR, subnets, routing

You know NAT vs IGW

You can build cloud networking using IaC

You can structure Terraform professionally

You can explain networking concepts clearly

This is a portfolio-grade project.
