🧩 1. Learn: HPA, VPA, Cluster Autoscaler
Horizontal Pod Autoscaler (HPA)
Scales pods based on metrics.

Common metrics:

CPU utilization

Memory utilization

Custom metrics (Prometheus Adapter)

External metrics (SQS queue length, etc.)

HPA adjusts replica count of a Deployment/ReplicaSet.

Formula (simplified):

desiredReplicas
=
currentReplicas
⋅
currentMetric
targetMetric
Example:
If CPU target = 50% and actual = 100%, replicas double.

Vertical Pod Autoscaler (VPA)
Adjusts container resources (CPU/memory requests/limits).

Modes:

Off — only recommendations

Auto — restarts pods with new resources

Initial — sets resources only at pod creation

VPA is not used together with HPA (except advanced setups).

Cluster Autoscaler
Scales nodes in the cluster.

Triggers:

Pending pods (insufficient resources)

Underutilized nodes (scale down)

Works on:

GKE

EKS

AKS

Karpenter (AWS alternative)

⚙️ 2. Task: Add HPA to Your App
You will add an HPA to your existing hello-api Deployment:

Min replicas: 3

Max replicas: 10

Scale based on CPU usage

Target CPU: 70%

Works perfectly on Kind (with metrics‑server installed).

📦 3. Deliverable: hpa.yaml
Place inside:

Code
day12-autoscaling/
└── manifests/
    └── hpa.yaml
Here is your production‑ready manifest:


🚀 Apply & Test
Apply:
bash
kubectl apply -f manifests/hpa.yaml
kubectl get hpa
Generate load:
bash
kubectl run load --image=busybox --restart=Never -- \
  sh -c "while true; do wget -q -O- http://hello-api; done"
Watch autoscaling:

bash
kubectl get deploy hello-api -w



