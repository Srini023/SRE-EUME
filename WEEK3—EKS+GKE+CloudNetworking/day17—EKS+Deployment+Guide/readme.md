🧩 1. Prerequisites
Before starting, ensure:

EKS cluster from Day 16 is running

kubectl, helm, awscli, eksctl installed

Your Helm chart from Day 14 is available locally

You are authenticated to AWS

OIDC provider is associated with your cluster

🧩 2. Install AWS Load Balancer Controller (ALB Ingress)
Add Helm repo
helm repo add eks https://aws.github.io/eks-charts
helm repo update

Associate IAM OIDC provider
bash
eksctl utils associate-iam-oidc-provider \
  --cluster sre-eks \
  --approve

Download IAM policy
curl -o iam-policy.json \
  https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/main/docs/install/iam_policy.json

Create IAM policy
aws iam create-policy \
  --policy-name AWSLoadBalancerControllerIAMPolicy \
  --policy-document file://iam-policy.json

Create service account
eksctl create iamserviceaccount \
  --cluster sre-eks \
  --namespace kube-system \
  --name aws-load-balancer-controller \
  --attach-policy-arn arn:aws:iam::<ACCOUNT_ID>:policy/AWSLoadBalancerControllerIAMPolicy \
  --approve \
  --override-existing-serviceaccounts

install ALB Controller
helm install aws-load-balancer-controller eks/aws-load-balancer-controller \
  -n kube-system \
  --set clusterName=sre-eks \
  --set serviceAccount.create=false \
  --set serviceAccount.name=aws-load-balancer-controller \
  --set region=us-east-1 \
  --set vpcId=$(aws eks describe-cluster --name sre-eks --query "cluster.resourcesVpcConfig.vpcId" --output text)

Verify:

kubectl get deployment -n kube-system aws-load-balancer-controller
