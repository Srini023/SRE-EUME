## 📝 **notes.md (your learning notes)**

```markdown
# Notes — Day 12 Autoscaling

## Horizontal Pod Autoscaler (HPA)
- Scales **pods** by adjusting Deployment replicas.
- Works on CPU, memory, custom metrics, external metrics.
- Uses the formula:

  desiredReplicas = currentReplicas * (currentMetric / targetMetric)

## Vertical Pod Autoscaler (VPA)
- Adjusts container **resource requests/limits**.
- Modes: Off, Auto, Initial.
- Not typically used together with HPA.

## Cluster Autoscaler
- Scales **nodes** in the cluster.
- Adds nodes when pods are pending.
- Removes underutilized nodes.
- Used in cloud environments (GKE, EKS, AKS).

## Key Takeaways
- HPA = scale pods.
- VPA = scale resources.
- Cluster Autoscaler = scale nodes.
- Metrics Server is mandatory for HPA.
