🧩 1. Learn: eksctl + Terraform
eksctl
A CLI tool that simplifies EKS cluster creation.

It handles:

VPC creation

Control plane provisioning

Node groups

IAM roles

Cluster bootstrap

Great for learning, demos, and quick clusters.

🔗 Connect to the Cluster
Update kubeconfig:
aws eks update-kubeconfig --region us-east-1 --name sre-eks

Verify:
kubectl get nodes
kubectl get pods -A

🧹 Destroy the Cluster
terraform destroy



