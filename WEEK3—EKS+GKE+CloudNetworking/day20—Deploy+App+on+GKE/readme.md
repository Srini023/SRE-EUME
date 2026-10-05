# Day 20 — Deploy App on GKE (Helm + GLB Ingress)

This guide deploys the `hello-api` Helm chart onto the GKE cluster created in Day 19 and exposes it using the Google Cloud Load Balancer (GLB) via the GKE Ingress Controller.

## Steps

### 1. Enable Required GCP Services
```bash
gcloud services enable container.googleapis.com compute.googleapis.com


2. Connect to GKE
gcloud container clusters get-credentials sre-gke --region <region> --project <project-id>


3. Enable Ingress in Helm Chart
Update values.yaml:

ingress.enabled = true

ingress.className = gce

add GLB annotations

Reserve global IP:
gcloud compute addresses create hello-api-ip --global


4. Deploy Helm Chart
helm install hello-api ./helm-chart
kubectl get pods
kubectl get svc
kubectl get ingress

5. Access the App
Retrieve GLB IP:
kubectl get ingress hello-api -o jsonpath='{.status.loadBalancer.ingress[0].ip}'


Test:
curl http://<GLB-IP>

Outcome
Your app is now:

Running on GKE

Exposed via Google Cloud Load Balancer

Fully production-ready





///////////////////////////////////////////////////////

🧩 1. Prerequisites
Before starting, ensure:

GKE cluster from Day 19 is running

kubectl, helm, gcloud installed

Your Helm chart from Day 14 is available

You are authenticated to GCP

You have a GCP project with billing enabled


🧩 2. Enable Required GCP Services
gcloud services enable \
  container.googleapis.com \
  compute.googleapis.com \
  cloudresourcemanager.googleapis.com

🧩 3. Connect to GKE Cluster
gcloud container clusters get-credentials sre-gke \
  --region <region> \
  --project <project-id>
Verify:
kubectl get nodes


🧩 4. Update Helm Chart for GKE Ingress (GLB)
Modify your values.yaml:

ingress:
  enabled: true
  className: "gce"
  host: hello.srini.gcp
  annotations:
    kubernetes.io/ingress.class: "gce"
    kubernetes.io/ingress.global-static-ip-name: "hello-api-ip"

Create a reserved global IP:
gcloud compute addresses create hello-api-ip \
  --global

🧩 5. Deploy Helm Chart on GKE
Install the chart:
helm install hello-api ./helm-chart
Verify:
kubectl get pods
kubectl get svc
kubectl get ingress

🧩 6. Access the Application
Get GLB IP:
kubectl get ingress hello-api -o jsonpath='{.status.loadBalancer.ingress[0].ip}'

Test:
curl http://<GLB-IP>


