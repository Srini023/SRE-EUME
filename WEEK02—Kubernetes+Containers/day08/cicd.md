🛠 CI/CD Integration
This project uses GitHub Actions to automate:

Build: Docker images for frontend and backend.

Push: Images to DockerHub (or any registry).

Deploy: Runs docker-compose with production overrides.

🔑 Secrets Required
Set these in GitHub repo → Settings → Secrets:

DOCKER_USERNAME

DOCKER_PASSWORD

🚀 Workflow
Push to main → triggers pipeline.

Build & Push → images uploaded to registry.

Deploy → production stack updated with latest images.

📉 Benefits
Fully automated build & deploy.

Environment‑specific overrides applied cleanly.

Registry integration ensures reproducible deployments.
