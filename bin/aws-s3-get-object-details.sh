#!/bin/bash

# Check environment variables
if [ -z "$BUCKET_NAME" ]; then
    echo "Error: BUCKET_NAME is not provided"
    exit 1
fi

if [ -z "$OBJECT_KEY" ]; then
    echo "Error: OBJECT_KEY is not provided"
    echo "Note: to check a folder, use the object key with a trailing slash: my/folder/"
    exit 1
fi

# Get Object Lock Details for the specific object
aws s3api head-object --bucket "$BUCKET_NAME" --key "$OBJECT_KEY"
