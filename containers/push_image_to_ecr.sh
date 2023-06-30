#!/bin/bash -e

DOCKER_REPO=$1

REGISTRY_URL=${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com
SOURCE_IMAGE="${DOCKER_REPO}"
TARGET_IMAGE="${REGISTRY_URL}/${DOCKER_REPO}"

# Construct latest tag
TARGET_IMAGE_LATEST="${TARGET_IMAGE}:latest"

# Construct dev tag
TARGET_IMAGE_DEV="${TARGET_IMAGE}:dev"

# Construct version number from datetime and commit hash
VERSION="${TIMESTAMP}-${TRAVIS_COMMIT}"
TARGET_IMAGE_VERSIONED="${TARGET_IMAGE}:${VERSION}"

# make sure correct region is set
aws configure set default.region ${AWS_REGION}

# Push image to ECR
###################

# Log in to AWS
$(aws ecr get-login --no-include-email)

# update latest version
docker tag ${SOURCE_IMAGE} ${TARGET_IMAGE_LATEST}
docker push ${TARGET_IMAGE_LATEST}

# push new version
docker tag ${SOURCE_IMAGE} ${TARGET_IMAGE_VERSIONED}
docker push ${TARGET_IMAGE_VERSIONED}