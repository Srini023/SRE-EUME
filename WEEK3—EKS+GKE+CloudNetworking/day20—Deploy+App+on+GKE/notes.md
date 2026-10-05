
---

# 📝 **notes.md (your learning notes)**

```markdown
# Notes — Day 20 Deploy App on GKE

## GLB Ingress (GCE Ingress Controller)
- Creates Google Cloud Load Balancer automatically.
- Supports global routing.
- Works with reserved static IPs.
- Handles health checks and backend services.

## Why GLB Instead of Nginx?
- Native GCP integration.
- Global load balancing.
- No need for NodePorts.
- Automatic firewall + health checks.

## Helm on GKE
- Helm chart provides reusable deployment.
- Values.yaml allows environment-specific overrides.
- Ingress enabled via Helm values.

## Flow
1. Enable GCP services.
2. Connect to GKE.
3. Enable ingress in Helm chart.
4. Deploy chart.
5. GLB is created automatically.
6. Access app via global IP.

## Key Takeaways
- GLB is the production ingress for GKE.
- Helm makes deployments repeatable.
- GKE + GLB + Helm = enterprise-grade setup.



