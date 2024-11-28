#!/bin/bash

# Check environment variables
if [ -z "$BUCKET_NAME" ]; then
    echo "Usage: $0 <bucket-name>"
    exit 1
fi

# Get Object Lock Configuration for the bucket
aws s3api get-object-lock-configuration --bucket "$BUCKET_NAME"
