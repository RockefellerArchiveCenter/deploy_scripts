#!/bin/bash -e

LAMBDA_FUNCTION_NAME=$1
LAMBDA_HANDLER_CODE=$2

mkdir package

# install requirements if necessary
if [ -f requirements.txt ]; then
  pip install -r requirements.txt --target ./package 
  cd package
  zip -r ../${LAMBDA_FUNCTION_NAME}.zip .
  cd ..
fi



# create zip file
BASENAME=$(basename ${LAMBDA_HANDLER_CODE})
cp ${LAMBDA_HANDLER_CODE} ${BASENAME}
zip ${LAMBDA_FUNCTION_NAME}.zip ${BASENAME}