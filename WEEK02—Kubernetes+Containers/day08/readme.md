⚙️ Build & Run

# Build image
docker build -t optimized-nginx .

# Run container with networking and volume
docker run -d \
  -p 8080:80 \
  -v $(pwd)/nginx-logs:/var/log/nginx \
  --name webapp optimized-nginx

🔗 Networking
Container port 80 mapped to host port 8080.

Accessible at: http://localhost:8080

💾 Volumes
Logs are persisted in nginx-logs directory on host.

Useful for debugging and monitoring.

📉 Image Optimization
Final image uses nginx:alpine (lightweight).

Build dependencies removed after first stage.

Only production-ready assets copied into runtime.



🛠 Features
Multi‑Stage Build: Keeps final image small by separating build and runtime.

Networking: Container exposes port 80 for communication.

Volumes: Logs stored in /var/log/nginx can be mounted to host for persistence.



