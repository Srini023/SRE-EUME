🔍 Explanation
Chart.yaml  
Metadata: chart name, version, app version.

values.yaml  
All configurable parameters (image, replicas, service type, ingress, HPA).

templates/  
Contains all Kubernetes manifests, but templated using Helm:

deployment.yaml — workload

service.yaml — networking

configmap.yaml — external config

ingress.yaml — optional HTTPS routing

hpa.yaml — optional autoscaling

_helpers.tpl — reusable template functions

NOTES.txt — post‑install instructions

README.md  
How to install, upgrade, uninstall the chart.

notes.md  
Your learning notes: charts, values, templating.





# Day 14 — Helm Chart for hello-api

This directory contains a full Helm chart for deploying the `hello-api` microservice.

## 📦 Chart Contents
- `Chart.yaml` — chart metadata
- `values.yaml` — configurable parameters
- `templates/` — templated Kubernetes manifests

## 🚀 Install the Chart

```bash
helm install hello-api ./helm-chart

🔄 Upgrade the Release
helm upgrade hello-api ./helm-chart


❌ Uninstall
helm uninstall hello-api


⚙️ Customize Values
Edit values.yaml to change:

replica count

image repository/tag

service type (NodePort, ClusterIP)

ingress settings

autoscaling (HPA)

Example:

yaml
replicaCount: 5
service:
  type: NodePort
  nodePort: 30081
