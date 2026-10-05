🧩 3. GCP Workload Identity
Workload Identity maps:

Kubernetes Service Account → GCP Service Account

Uses OIDC federation

No JSON key files

Flow
Enable Workload Identity

Create GCP service account

Allow KSA to impersonate GSA

Annotate Kubernetes service account

Pods automatically get GCP credentials

Step-by-step
1. Enable Workload Identity on GKE
gcloud container clusters update sre-gke \
  --workload-pool=<PROJECT_ID>.svc.id.goog


2. Create GCP service account
gcloud iam service-accounts create app-gsa


3. Allow KSA to impersonate GSA
gcloud iam service-accounts add-iam-policy-binding \
  app-gsa@<PROJECT_ID>.iam.gserviceaccount.com \
  --member="serviceAccount:<PROJECT_ID>.svc.id.goog[default/app-sa]" \
  --role="roles/storage.objectViewer"

4. Annotate Kubernetes service account
apiVersion: v1
kind: ServiceAccount
metadata:
  name: app-sa
  namespace: default
  annotations:
    iam.gke.io/gcp-service-account: app-gsa@<PROJECT_ID>.iam.gserviceaccount.com


5. Use the service account in your Deployment
spec:
  serviceAccountName: app-sa

Pods now automatically receive GCP credentials via Workload Identity.
