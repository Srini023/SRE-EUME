# Day 15 — AWS VPC Deep Dive (Terraform)

This module builds a production-style AWS VPC using Terraform.

## 📦 Components
- VPC (10.0.0.0/16)
- Public subnet (10.0.1.0/24)
- Private subnet (10.0.2.0/24)
- Internet Gateway (IGW)
- NAT Gateway
- Public + private route tables

All resources are defined in `manifests/vpc.tf`.

---

## 🚀 Deploy the VPC

### Initialize Terraform
```bash
terraform init


Preview changes
terraform plan


Apply
terraform apply


Destroy the VPC
terraform destroy


📘 Requirements
AWS CLI configured (aws configure)

IAM user with VPC + EC2 permissions

Terraform installed

🎯 Outcome
You now have a fully functional VPC with:

Public subnet for internet-facing resources

Private subnet for secure workloads

NAT gateway for outbound-only private traffic

Proper routing for production-grade architecture


⚙️ 2. Task: Build VPC via Terraform
You will build:

VPC

1 public subnet

1 private subnet

IGW

NAT Gateway

Public + private route tables




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


🧩 1. Learn: Subnets, NAT, IGW, Route Tables
VPC
A logically isolated network inside AWS.
You choose:

CIDR block

Subnet layout

Routing

Security boundaries

Subnets
Sub‑ranges inside the VPC.

Types:

Public subnet → has route to Internet Gateway

Private subnet → no direct internet route

Best practice:

Spread subnets across multiple AZs

Keep public subnets minimal

Use private subnets for workloads

Internet Gateway (IGW)
A horizontally scaled gateway that allows:

Outbound internet access

Inbound traffic to public subnets

Attached at VPC level.

NAT Gateway
Allows private subnets to reach the internet without exposing them.

Key points:

Lives in a public subnet

Needs an Elastic IP

Highly available per AZ (one NAT per AZ recommended)

Route Tables
Define how traffic flows.

Examples:

Public RT → 0.0.0.0/0 → IGW

Private RT → 0.0.0.0/0 → NAT Gateway

Route tables + subnet associations = network behavior.

⚙️ 2. Task: Build VPC via Terraform
You will build:

VPC

1 public subnet

1 private subnet

IGW

NAT Gateway

Public + private route tables
