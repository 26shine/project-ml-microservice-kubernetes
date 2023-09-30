#!/usr/bin/env bash

## Complete the following steps to get Docker running locally

# Step 1:
# Build image and add a descriptive tag
DOCKER_PATH="49shine/microservice-kubernetes"
KVDB_BUCKET_ID="8p64HNePskjHL3HqkfRnUC"
DOCKER_TAG=$(curl --insecure https://kvdb.io/$KVDB_BUCKET_ID/ml_microservice_api_tag)

docker build -t $DOCKER_PATH:$DOCKER_TAG .

# Step 2: 
# List docker images
docker images

# Step 3: 
# Run flask app
docker run -p 80:80 $DOCKER_PATH:$DOCKER_TAG
