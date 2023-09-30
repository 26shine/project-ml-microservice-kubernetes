#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
# dockerpath=<>
DOCKER_PATH="49shine/microservice-kubernetes"

# Step 2
# Run the Docker Hub container with kubernetes
kubectl run ml-microservice-api --image=$DOCKER_PATH --port=80

# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to a host
kubectl port-forward ml-microservice-api 8000:80
