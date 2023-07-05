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
cp ${LAMBDA_HANDLER_CODE} basename ${LAMBDA_HANDLER_CODE}
zip ${LAMBDA_FUNCTION_NAME}.zip basename ${LAMBDA_HANDLER_CODE}