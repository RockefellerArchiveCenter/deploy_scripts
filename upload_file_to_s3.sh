#!/bin/bash -e

FILE_NAME=$1
BUCKET_NAME=$2

# make sure correct region is set
aws configure set default.region ${AWS_REGION}

aws s3 mv ${FILE_NAME} s3://${BUCKET_NAME}/${FILE_NAME}

