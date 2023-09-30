#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
# dockerpath=<your docker ID/path>
DOCKER_PATH="49shine/microservice-kubernetes"
DOCKER_TAG="$(date +%Y%m%d%H%M%S)"
KVDB_BUCKET_ID="8p64HNePskjHL3HqkfRnUC"

# Step 2:  
# Authenticate & tag
echo "Docker ID and Image: $DOCKER_PATH"
curl --insecure https://kvdb.io/$KVDB_BUCKET_ID/ml_microservice_api_tag -d $DOCKER_TAG

docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD
docker build -t $DOCKER_PATH:$DOCKER_TAG .
docker image tag $DOCKER_PATH:$DOCKER_TAG $DOCKER_PATH
# Step 3:
# Push image to a docker repository
docker push $DOCKER_PATH:$DOCKER_TAG
