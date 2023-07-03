#!/bin/bash -e

FILE_NAME=$1
BUCKET_NAME=$2

aws s3 mv ${FILE_NAME} s3://${BUCKET_NAME}/${FILE_NAME}

