#!/bin/bash -e

APP_NAME=$1
BUCKET_NAME=$2

# make sure correct region is set
aws configure set default.region ${AWS_REGION}

aws s3 mv ${APP_NAME}.template s3://${BUCKET_NAME}/${APP_NAME}.template

