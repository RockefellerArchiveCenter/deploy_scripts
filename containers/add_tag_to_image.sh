#!/bin/bash -e

REPO_NAME = $1
CURRENT_TAG = $2
NEW_TAG = $3

# make sure correct region is set
aws configure set default.region ${AWS_REGION}

MANIFEST=$(aws ecr batch-get-image \
    --repository-name ${REPO_NAME} \
    --image-ids imageTag=${CURRENT_TAG} \
    --output json | jq --raw-output --join-output '.images[0].imageManifest')

aws ecr put-image \
    --repository-name ${REPO_NAME} \
    --image-tag ${NEW_TAG} \
    --image-manifest "$MANIFEST"