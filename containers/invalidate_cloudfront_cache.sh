#!/bin/bash -e

# make sure correct region is set
aws configure set default.region ${AWS_REGION}

aws cloudfront create-invalidation \
    --distribution-id ${CLOUDFRONT_DISTRIBUTION_ID} \
    --paths "/*"