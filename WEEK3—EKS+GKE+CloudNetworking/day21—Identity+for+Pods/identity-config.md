# Day 21 — Identity for Pods (AWS IRSA + GCP Workload Identity)

This document explains how to configure pod-level IAM on AWS and GCP using modern identity mechanisms.

---

## AWS IRSA (IAM Roles for Service Accounts)

### Steps
1. Create IAM policy.
2. Create IAM role with OIDC trust.
3. Annotate Kubernetes service account:
```yaml
eks.amazonaws.com/role-arn: arn:aws:iam::<ACCOUNT_ID>:role/app-irsa-role
Use the service account in your Deployment.

Pods automatically receive AWS credentials via IRSA.



GCP Workload Identity
Steps
Enable Workload Identity on GKE.

Create GCP service account.

Bind KSA → GSA:
serviceAccount:<PROJECT_ID>.svc.id.goog[default/app-sa]

Annotate Kubernetes service account:
yaml
iam.gke.io/gcp-service-account: app-gsa@<PROJECT_ID>.iam.gserviceaccount.com

Use the service account in your Deployment.
Pods automatically receive GCP credentials via Workload Identity.
