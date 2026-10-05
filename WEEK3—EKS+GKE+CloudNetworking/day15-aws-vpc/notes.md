
---

## 📝 **notes.md (your learning notes)**

```markdown
# Notes — Day 15 AWS VPC Deep Dive

## VPC
- Logical network boundary inside AWS.
- CIDR block defines IP range.
- DNS hostnames + DNS support recommended for most workloads.

## Subnets
- Public subnet → route to IGW.
- Private subnet → no direct internet route.
- Best practice: one public + one private per AZ.

## Internet Gateway (IGW)
- Enables inbound/outbound internet access.
- Must be attached to the VPC.
- Public route table sends `0.0.0.0/0` → IGW.

## NAT Gateway
- Allows private subnets to reach the internet securely.
- Requires an Elastic IP.
- Lives in a public subnet.
- Private route table sends `0.0.0.0/0` → NAT.

## Route Tables
- Public RT → IGW.
- Private RT → NAT.
- Subnet associations define behavior.

## Key Takeaways
- Public = IGW route.
- Private = NAT route.
- NAT protects private workloads.
- Terraform makes VPC creation reproducible and version-controlled.

