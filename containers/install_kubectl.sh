#!/bin/bash -e

# Download kubectl. Must match, within one minor version, the version of kubernetes.
curl -LO https://dl.k8s.io/release/v1.24.0/bin/linux/amd64/kubectl
chmod +x kubectl
mv ./kubectl /usr/local/bin/kubectl

# Set up config. Assumes KUBE_CONFIG is a base_64 encoded kube-config file. 
# See https://caveofcode.com/continuous-delivery-to-kubernetes-with-travis-ci/
mkdir ${HOME}/.kube
echo "$KUBE_CONFIG" | base64 --decode > ${HOME}/.kube/config