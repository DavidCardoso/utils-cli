#!/bin/bash

# Check if the bucket name and object key arguments are provided
if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Usage: $0 <bucket-name> <object-key>"
    echo "Note: to check a folder, use the object key with a trailing slash: my/folder/"
    exit 1
fi

BUCKET_NAME=$1
OBJECT_KEY=$2

# Get Object Lock Details for the specific object
aws s3api head-object --bucket "$BUCKET_NAME" --key "$OBJECT_KEY"
