#!/bin/bash

# Check if the bucket name argument is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <bucket-name>"
    exit 1
fi

BUCKET_NAME=$1

# Get Object Lock Configuration for the bucket
aws s3api get-object-lock-configuration --bucket "$BUCKET_NAME"
