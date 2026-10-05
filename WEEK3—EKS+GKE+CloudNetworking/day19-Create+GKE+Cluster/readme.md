# Day 19 — Create GKE Cluster (Terraform)

This module deploys a production-style GKE cluster using the official Google Cloud Terraform modules.

## 📦 Components
- VPC (via terraform-google-modules/network)
- Regional GKE cluster
- Private nodes
- Node pool (e2-medium)
- Release channel (REGULAR)

All resources are defined in `manifests/gke-cluster.tf`.

---

## 🚀 Deploy the GKE Cluster

### Initialize Terraform
```bash
terraform init



🧩 1. Learn: Terraform GKE Module
Google Cloud’s GKE architecture differs from EKS:

GKE Key Concepts
Control plane is regional (high availability by default)

Node pools define worker node groups

VPC is global, subnets are regional

Firewall rules apply at VPC level

Cloud NAT required for private nodes

Terraform GKE Module
The official module:

Code
terraform-google-modules/kubernetes-engine/google
It handles:

GKE cluster

Node pools

IAM

Network integration

Autoscaling

Private clusters

Release channels

This is the production standard for GKE deployments.

🧩 2. Task: Deploy GKE via Terraform
You will deploy:

Regional GKE cluster

One node pool

Private nodes

Cloud NAT for outbound traffic

VPC + subnets (if not already created in Day 18)


🔗 Connect to the Cluster
Retrieve credentials:
gcloud container clusters get-credentials sre-gke --region <region> --project <project-id>

Verify:
kubectl get nodes
kubectl get pods -A

notes.md

---

## 📝 **notes.md (your learning notes)**

```markdown
# Notes — Day 19 GKE Cluster

## GKE Architecture
- Control plane is regional.
- Nodes run in regional subnets.
- VPC is global; subnets are regional.
- Cloud NAT required for private nodes.

## Terraform GKE Module
- Handles cluster creation, node pools, IAM.
- Supports private clusters.
- Integrates with VPC module.
- Release channels: RAPID, REGULAR, STABLE.

## Private Cluster
- Nodes have no public IPs.
- Control plane reachable via private endpoint.
- Cloud NAT enables outbound internet.

## Node Pools
- Separate scaling from control plane.
- Auto-repair and auto-upgrade recommended.
- Machine types: e2-medium for dev, n2-standard for prod.

## Key Takeaways
- GKE is simpler than EKS due to native Google networking.
- Terraform modules make GKE reproducible.
- Private clusters are the production standard.



