🧩 1. Learn: API Server, Scheduler, Kubelet
API Server (kube-apiserver)
The front door of the Kubernetes control plane.
Everything — kubectl, controllers, schedulers, operators — talks to the API server.

Key responsibilities:

Validates and stores objects in etcd

Exposes REST endpoints for all Kubernetes resources

Handles authentication, authorization, admission controllers

Acts as the single source of truth for cluster state

Scheduler (kube-scheduler)
Decides which node a Pod should run on.

Scheduling logic:

Filters nodes (predicates): resource availability, taints/tolerations, affinity

Scores nodes (priorities): spreading, resource balance

Binds Pod → Node

It does not start containers — kubelet does.

Kubelet
Runs on every node.
Responsible for actual Pod lifecycle.

Key responsibilities:

Watches API server for Pod assignments

Talks to container runtime (containerd)

Executes liveness/readiness/startup probes

Manages cgroups, volumes, secrets

Reports node + pod status back to API server

⚙️ 2. Task: Deploy Kind Cluster
Kind = Kubernetes IN Docker
Perfect for local learning, CI, and fast cluster resets.

Requirements:

Docker installed

Kind binary installed

📦 3. Deliverable: Kind Cluster Setup Script
Below is a fully‑ready, production‑style script that creates a 1‑control‑plane + 2‑worker Kind cluster with a custom config.

You can save it as setup-kind.sh and run:

bash
bash setup-kind.sh
