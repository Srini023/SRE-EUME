#!/usr/bin/env bash
set -e

CLUSTER_NAME="kind-sre-lab"

echo "[1/5] Checking prerequisites..."
command -v docker >/dev/null 2>&1 || { echo "Docker not installed"; exit 1; }
command -v kind >/dev/null 2>&1 || { echo "Kind not installed"; exit 1; }

echo "[2/5] Creating Kind config file..."
cat <<EOF > kind-config.yaml
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4

nodes:
  - role: control-plane
    kubeadmConfigPatches:
      - |
        kind: InitConfiguration
        nodeRegistration:
          kubeletExtraArgs:
            node-labels: "node-role.kubernetes.io/control-plane=true"

  - role: worker
    kubeadmConfigPatches:
      - |
        kind: JoinConfiguration
        nodeRegistration:
          kubeletExtraArgs:
            node-labels: "node-role.kubernetes.io/worker=true"

  - role: worker
    kubeadmConfigPatches:
      - |
        kind: JoinConfiguration
        nodeRegistration:
          kubeletExtraArgs:
            node-labels: "node-role.kubernetes.io/worker=true"

networking:
  disableDefaultCNI: false
  kubeProxyMode: "iptables"
EOF

echo "[3/5] Creating Kind cluster: $CLUSTER_NAME..."
kind create cluster --name "$CLUSTER_NAME" --config kind-config.yaml

echo "[4/5] Verifying cluster..."
kubectl cluster-info
kubectl get nodes -o wide

echo "[5/5] Cluster setup complete!"
echo "Use: kubectl get pods -A"

