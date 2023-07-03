#!/bin/bash -e

FILE_NAME=$1
BUCKET_NAME=$2

if [[ $FILE_NAME == *.zip ]]
then
     aws s3 mv --zip-file fileb://${FILE_NAME} s3://${BUCKET_NAME}/${FILE_NAME}
else
    aws s3 mv ${FILE_NAME} s3://${BUCKET_NAME}/${FILE_NAME}
fi
