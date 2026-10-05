🧩 1. Why Identity for Pods?
Traditional apps used:

Access keys

Service account JSON files

Secrets mounted into pods

These are insecure.

Modern cloud-native identity uses:

AWS IRSA → IAM Roles for Service Accounts

GCP Workload Identity → GCP IAM mapped to Kubernetes SA

Both rely on:

OIDC federation

Short‑lived tokens

No long‑lived credentials


🧩 2. AWS IRSA (IAM Roles for Service Accounts)
IRSA lets a Kubernetes service account assume an IAM role.

Flow
EKS cluster has an OIDC provider

You create an IAM role with a trust policy

You annotate a Kubernetes service account

Pods using that SA automatically get AWS credentials


Step-by-step
1. Create IAM policy
Example: allow S3 read.
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": ["s3:GetObject"],
      "Resource": "arn:aws:s3:::my-bucket/*"
    }
  ]
}

2. Create IAM role for IRSA
Trust policy:
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Federated": "arn:aws:iam::<ACCOUNT_ID>:oidc-provider/<OIDC_PROVIDER>"
      },
      "Action": "sts:AssumeRoleWithWebIdentity",
      "Condition": {
        "StringEquals": {
          "<OIDC_PROVIDER>:sub": "system:serviceaccount:default:app-sa"
        }
      }
    }
  ]
}


3. Annotate Kubernetes service account
apiVersion: v1
kind: ServiceAccount
metadata:
  name: app-sa
  namespace: default
  annotations:
    eks.amazonaws.com/role-arn: arn:aws:iam::<ACCOUNT_ID>:role/app-irsa-role

4. Use the service account in your Deployment
spec:
  serviceAccountName: app-sa


