#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
# dockerpath=<>
DOCKER_PATH="49shine/microservice-kubernetes"
KVDB_BUCKET_ID="8p64HNePskjHL3HqkfRnUC"
DOCKER_TAG=$(curl --insecure https://kvdb.io/$KVDB_BUCKET_ID/ml_microservice_api_tag)
POD_TAG="$(date +%Y%m%d%H%M%S)"

# Step 2
# Run the Docker Hub container with kubernetes
kubectl run ml-api-$POD_TAG --image=$DOCKER_PATH:$DOCKER_TAG --port=80

# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to a host
POD_NAME="ml-api-$POD_TAG"

# Wait for the pod to be in the "Running" state
while [ "$(kubectl get pod "$POD_NAME" -o jsonpath='{.status.phase}' 2>/dev/null)" != "Running" ]; do
    echo "Waiting for pod $POD_NAME to be in the 'Running' state..."
    sleep 5
done

# Once the pod is running, forward ports
echo "Pod $POD_NAME is now in the 'Running' state. Forwarding ports..."
kubectl port-forward "$POD_NAME" 8000:80
