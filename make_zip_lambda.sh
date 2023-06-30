#!/bin/bash -e

LAMBDA_FUNCTION_NAME=$1
LAMBDA_HANDLER_CODE=$2

mkdir package

# install requirements if necessary
if [ -f requirements.txt ]; then
  pip install -r requirements.txt --target ./package 
fi

# create zip file
zip -r ${LAMBDA_FUNCTION_NAME}.zip package
zip ${LAMBDA_FUNCTION_NAME}.zip ${LAMBDA_HANDLER_CODE}