#!/bin/bash
set -xe


# Copy war file from S3 bucket to tomcat webapp folder
aws s3 cp -r s3://##s3-bucket##/dist /usr/local/app/dist
aws s3 cp -r s3://##s3-bucket##/tsconfig.json /usr/local/app/tsconfig.json
aws s3 cp -r s3://##s3-bucket##/package.json /usr/local/app/package.json

cd /usr/local/app/

sudo yarn
