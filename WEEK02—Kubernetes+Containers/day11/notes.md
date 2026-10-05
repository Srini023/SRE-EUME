🔍 Purpose of Each File
ingress.yaml
Routes HTTPS traffic

Terminates TLS

Uses cert‑manager annotations

clusterissuer.yaml
Defines Let’s Encrypt ACME issuer

Handles HTTP‑01 challenge via Nginx

certificate.yaml
Explicit certificate request

Creates hello-api-tls secret

Useful for clarity + GitOps workflows

README.md
Installation steps

How to apply manifests

How to verify TLS

notes.md
Ingress concepts

TLS flow

cert‑manager internals
