#!/bin/bash -e

# Remove existing deployment
kubectl delete deployment ${DEPLOYMENT_NAME}

# Apply deployments, configmaps and services
for TEMPLATE in k8s/*.yaml
do
    kubectl apply -f TEMPLATE
done