#!/bin/bash -e

LAMBDA_FUNCTION_NAME="$1"
LAMBDA_HANDLER_CODE_PATHS="${*:2}"

# install requirements if necessary
if [ -f requirements.txt ]; 
then
  mkdir package
  source ~/virtualenv/python${TRAVIS_PYTHON_VERSION}/bin/activate
  pip install -r requirements.txt --target ./package 
  cd package
  zip -r ../${LAMBDA_FUNCTION_NAME}.zip .
  cd ..
fi

# Copy handler code files
for PATH in ${LAMBDA_HANDLER_CODE_PATHS[@]}
do
  BASENAME=$(basename ${PATH})
  cp ${PATH} ${BASENAME}
done

zip ${LAMBDA_FUNCTION_NAME}.zip ${BASENAME}