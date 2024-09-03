kind create cluster --name nginx-cluster
# Or using cluster manifest file.
# kind create cluster --config ./manifests/kind-cluster.yaml

# get info about cluster.
kind get clusters

# Apply pod creation
kubectl apply -f ./manifests/nginx-pod.yaml

# Apply service creation for pod
kubectl apply -f ./manifests/nginx-service.yaml

#Forward port to start locally nginx page
kubectl port-forward svc/nginx-service 56000:80

# Check URL of nginx.
# http://localhost:56000

# get info about cluster (we need ip and port) (no needed)
kubectl get services nginx-service