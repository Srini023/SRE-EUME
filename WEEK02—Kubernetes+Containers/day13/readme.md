# Day 13 — RBAC + Network Policies

This module locks down the cluster using:
- RBAC (Roles + RoleBindings)
- Network Policies (default deny + controlled ingress)

## Apply

```bash
kubectl apply -f manifests/rbac.yaml
kubectl apply -f manifests/netpol.yaml


Verify RBAC
kubectl auth can-i list pods --as system:serviceaccount:default:hello-api-sa

Verify NetworkPolicy
kubectl describe netpol hello-api-netpol



