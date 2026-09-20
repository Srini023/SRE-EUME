Architecture Diagram (GCP Version)

VPC: sre-vpc
 ├── Public Subnet: 10.0.1.0/24
 │     └── (Optional) VM with external IP
 │
 └── Private Subnet: 10.0.2.0/24
       ├── VM (no external IP)
       └── Cloud Router + Cloud NAT
             → Provides outbound internet access

What This Project Demonstrates to Recruiters
You understand GCP networking (VPC, subnets, Cloud NAT, Cloud Router)

You can build cloud networking using Terraform

You can mirror AWS → GCP architectures

You understand private subnet internet access

You can structure Terraform professionally

This is a portfolio-grade multi-cloud networking project.
