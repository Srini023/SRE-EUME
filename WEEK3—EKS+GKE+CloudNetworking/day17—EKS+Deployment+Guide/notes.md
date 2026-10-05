🧩 4. Deploy Helm Chart on EKS
Connect to EKS
aws eks update-kubeconfig --region us-east-1 --name sre-eks

Deploy
helm install hello-api ./helm-chart

Verify
kubectl get pods
kubectl get svc
kubectl get ingress


🧩 5. Access the Application
Get ALB DNS
kubectl get ingress hello-api -o jsonpath='{.status.loadBalancer.ingress[0].hostname}'

Test
curl http://<ALB-DNS>


# Day 17 — Deploy App on EKS (Helm + ALB Ingress)

This guide deploys the `hello-api` Helm chart onto the EKS cluster created in Day 16 and exposes it using the AWS ALB Ingress Controller.

## Steps

### 1. Install AWS Load Balancer Controller
- Add Helm repo
- Create IAM OIDC provider
- Create IAM policy
- Create service account
- Install ALB controller

### 2. Enable Ingress in Helm Chart
Update `values.yaml`:
- ingress.enabled = true
- ingress.className = alb
- add ALB annotations

### 3. Deploy Helm Chart
```bash
helm install hello-api ./helm-chart
kubectl get ingress





---

## 📝 **notes.md (your learning notes)**

```markdown
# Notes — Day 17 Deploy App on EKS

## ALB Ingress Controller
- Manages AWS Application Load Balancers.
- Creates ALB automatically based on Ingress resources.
- Supports path-based routing, TLS, WAF, IP targets.

## Why ALB Instead of Nginx?
- Native AWS integration.
- No need for NodePorts.
- Better autoscaling and health checks.
- Works with EKS-managed security groups.

## Helm on EKS
- Helm chart provides reusable deployment.
- Values.yaml allows environment-specific overrides.
- Ingress enabled via Helm values.

## Flow
1. Install ALB controller.
2. Enable ingress in Helm chart.
3. Deploy chart.
4. ALB is created automatically.
5. Access app via ALB DNS.

## Key Takeaways
- ALB is the production ingress for EKS.
- Helm makes deployments repeatable.
- EKS + ALB + Helm = enterprise-grade setup.

