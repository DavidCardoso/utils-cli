#!/bin/bash

# Check environment variables
if [ -z "$BUCKET_NAME" ]; then
    echo "Error: BUCKET_NAME is not provided"
    exit 1
fi

# Get Details for the bucket
echo "// Head Bucket "
aws s3api head-bucket --bucket "$BUCKET_NAME"

echo
echo "// Lifecycle Configuration"
aws s3api get-bucket-lifecycle-configuration --bucket "$BUCKET_NAME"
