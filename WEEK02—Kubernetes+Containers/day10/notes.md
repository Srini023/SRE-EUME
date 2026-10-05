🚀 Apply the Microservice
bash
kubectl apply -f manifests/
kubectl get pods -o wide
kubectl get svc hello-api
Access it:

bash
curl http://localhost:30080
