
---

## 📝 **notes.md (your learning notes)**

```markdown
# Notes — Day 16 EKS Cluster

## eksctl
- CLI tool for quick EKS creation.
- Handles VPC, IAM, node groups automatically.
- Great for demos and learning.

## Terraform for EKS
- Production-grade approach.
- Uses official AWS modules.
- Provides versioning, reproducibility, GitOps compatibility.

## EKS Architecture
- Control plane managed by AWS.
- Worker nodes run in private subnets.
- Node groups can be managed or self-managed.
- Addons: CoreDNS, kube-proxy, VPC CNI.

## VPC Requirements
- Private subnets for nodes.
- Public subnets for NAT gateway.
- NAT required for nodes to reach the internet securely.

## Key Takeaways
- eksctl = simple, fast.
- Terraform = scalable, production-ready.
- EKS requires proper VPC design.
- Managed node groups simplify lifecycle management.

