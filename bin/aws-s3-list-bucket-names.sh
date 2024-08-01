#!/bin/bash

set -e

BUCKET_NAMES_FILE="${BUCKET_NAMES_FILE:-buckets.txt}"

aws s3api list-buckets --query "Buckets[].Name" --output table >$BUCKET_NAMES_FILE

echo "List of buckets saved to '$BUCKET_NAMES_FILE'"
