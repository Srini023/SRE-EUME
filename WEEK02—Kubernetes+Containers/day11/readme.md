🧩 1. Learn: Ingress + Cert‑Manager
Ingress
Ingress provides HTTP/HTTPS routing into your cluster.

Key concepts:

Ingress Controller (Nginx, Traefik, GKE Ingress)

Rules (host → service)

TLS (certificates + HTTPS termination)

Annotations (controller‑specific behavior)

Ingress itself is only a spec — the controller implements it.

Cert‑Manager
Cert‑Manager automates:

Certificate issuance

Renewal

ACME challenges (Let’s Encrypt)

Storing certs in Kubernetes Secrets

Core resources:

Issuer / ClusterIssuer

Certificate

⚙️ 2. Task: Add HTTPS to Your App
You will:

Install cert‑manager (if not already installed)

Create a ClusterIssuer (Let’s Encrypt staging or production)

Create an Ingress that:

Routes https://hello.srini.local → hello-api service

Uses TLS via cert‑manager

Auto‑generates certificates

Works perfectly on:

Kind (with Nginx Ingress)

Minikube

GKE/EKS/AKS

📦 3. Deliverable: ingress.yaml
Place this file inside:

Code
day11-ingress-tls/
└── manifests/
    └── ingress.yaml
