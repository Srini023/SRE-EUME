🧩 1. Learn: Deployments, Services, ConfigMaps
Deployments
A Deployment manages stateless workloads.
It ensures:

Declarative updates (rolling updates, rollbacks)

Replica management

Self‑healing (restarts failed pods)

Versioned rollouts

You define:

Container image

Replicas

Probes

Resource limits

Labels/selectors

Services
A Service provides stable networking for Pods.

Types:

ClusterIP — internal-only (default)

NodePort — exposes on each node’s port

LoadBalancer — cloud load balancer (GKE, EKS, AKS)

Headless — service discovery without proxy

Services match Pods using selectors.

ConfigMaps
External configuration injected into Pods.

Used for:

Environment variables

Config files

Command arguments

ConfigMaps allow you to change configuration without rebuilding the image.

⚙️ 2. Task: Deploy a Microservice
You will deploy a simple microservice:

app: hello-api

image: nginxdemos/hello:latest

port: 80

config: custom greeting injected via ConfigMap

exposure: NodePort (works on Kind)

📦 3. Deliverable: manifests/ Directory
Below is a complete, ready-to-apply Kubernetes manifest set.

Create a folder:

bash
mkdir manifests
