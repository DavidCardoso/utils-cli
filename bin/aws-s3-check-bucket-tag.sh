#!/bin/bash

set -o pipefail

# Variables for tag name and value
TAG_NAME="${TAG_NAME:-backup_tier}"
TAG_VALUE="${TAG_VALUE:-class_a}"

echo "Buckets with tag '$TAG_NAME=$TAG_VALUE'":

# List of S3 buckets
BUCKET_NAMES_FILE="${BUCKET_NAMES_FILE:-buckets.txt}"
TAGS_FILE=tags.txt
buckets=$(cat $BUCKET_NAMES_FILE)

# Iterate over each bucket to check for the specified tag
for bucket in $buckets; do
    # Get the tags for the current bucket
    if aws s3api get-bucket-tagging --bucket "$bucket" --query "TagSet" --output table 2>1 >/dev/null; then
        aws s3api get-bucket-tagging --bucket "$bucket" --query "TagSet" --output table >$TAGS_FILE
        hasTag=$(grep "$TAG_NAME" "$TAGS_FILE" | grep "$TAG_VALUE")
    else
        echo "❌ $bucket"
        continue
    fi

    # Check if the bucket has the specified tag
    if [[ -n "$hasTag" ]]; then
        echo "✅ $bucket"
    else
        echo "❌ $bucket"
    fi
done

# Cleat temp files
rm -f $TAGS_FILE
