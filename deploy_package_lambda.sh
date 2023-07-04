#!/bin/bash -e

LAMBDA_FUNCTION_NAME=$1

aws lambda update-function-code \
    --function-name  ${LAMBDA_FUNCTION_NAME} \
    --zip-file fileb://${LAMBDA_FUNCTION_NAME}.zip