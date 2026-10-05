🧩 1. Learn: Global VPC + Firewall Rules
Global VPC
GCP VPCs are global, unlike AWS VPCs which are regional.

Key properties:

One VPC spans all regions

Subnets are regional

Routing is global

Firewall rules apply at VPC level

Source: GCP VPC networks are global constructs with regional subnets .

Firewall Rules
Firewall rules in GCP:

Are stateful

Apply at the network level

Use targets (tags or service accounts)

Support ingress + egress

Source: GCP firewall rules are part of VPC configuration and can be defined via Terraform modules or standalone resources .

⚙️ 2. Task: Build GCP VPC via Terraform
You will build:

Custom VPC (auto‑create subnets disabled)

Public + private subnets

Firewall rules

Optional Cloud NAT (production pattern)
