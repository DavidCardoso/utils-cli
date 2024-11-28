#!/bin/bash

# Check if the bucket name arguments are provided
if [ -z "$1" ]; then
    echo "Usage: $0 <bucket-name>"
    exit 1
fi

BUCKET_NAME=$1
OBJECT_KEY=$2

# Get Details for the bucket
echo "// Head Bucket "
aws s3api head-bucket --bucket "$BUCKET_NAME"

echo
echo "// Lifecycle Configuration"
aws s3api get-bucket-lifecycle-configuration --bucket "$BUCKET_NAME"
