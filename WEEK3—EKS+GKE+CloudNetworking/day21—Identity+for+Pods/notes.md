
---

# 📝 **notes.md**

```markdown
# Notes — Day 21 Identity for Pods

## Why Identity for Pods?
- No long-lived keys.
- No secrets mounted.
- Uses OIDC federation.
- Short-lived tokens.

## AWS IRSA
- Maps KSA → IAM Role.
- Uses sts:AssumeRoleWithWebIdentity.
- Annotation: eks.amazonaws.com/role-arn.

## GCP Workload Identity
- Maps KSA → GCP Service Account.
- Uses GCP Workload Pool.
- Annotation: iam.gke.io/gcp-service-account.

## Key Takeaways
- IRSA and Workload Identity are mandatory for production.
- Both eliminate credential files.
- Both integrate tightly with cloud IAM.

