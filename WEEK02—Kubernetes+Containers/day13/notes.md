
```markdown
# Notes — Day 13 RBAC + Network Policies

## RBAC
- Role = namespace permissions
- ClusterRole = cluster-wide permissions
- RoleBinding = bind Role → SA
- Least privilege is mandatory for production

## Pod Security (PSP/PSA)
- PSP deprecated
- PSA modes: privileged, baseline, restricted

## Network Policies
- Control pod-to-pod traffic
- Ingress + Egress rules
- Default deny is the safest baseline
- Requires a CNI that supports NetworkPolicy (Calico, Cilium, Weave)

## Key Takeaways
- RBAC secures **who** can act.
- NetworkPolicy secures **what** can communicate.
- Together they form Kubernetes’ core security model.
