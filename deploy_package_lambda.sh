#!/bin/bash -e

LAMBDA_FUNCTION_NAME=$1

# make sure correct region is set
aws configure set default.region ${AWS_REGION}

aws lambda update-function-code \
    --function-name  ${LAMBDA_FUNCTION_NAME} \
    --zip-file fileb://${LAMBDA_FUNCTION_NAME}.zip