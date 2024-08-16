#!/bin/bash

# For log purpose (e.g., when runned remotely via GitHub raw content URL)
SERVICE=utils-cli-bin-aws-s3-list-bucket-names

# Args
BUCKETS_LIST_FILE="${BUCKETS_LIST_FILE:-/tmp/${SERVICE}.log}"

# Filter/regex. Defaults to all (no filter).
BUCKET_NAME_FILTER=${BUCKET_NAME_FILTER:-}

# Output
OUTPUT_FILE=${BUCKETS_LIST_FILE}
OUTPUT=

# Main command
response=$(aws s3api list-buckets --query "Buckets[].Name" --output json --no-cli-pager)
response_code=$?

# Error
if [[ "${response_code}" != '0' ]]; then
    echo "${response}" >${OUTPUT_FILE}
    echo "Service: ${SERVICE}"
    echo "Error: code=${response_code} ${response}"
    echo "Logs saved to: '${OUTPUT_FILE}'"
    exit 1
fi

# Success
# gets just the bucket names
OUTPUT=$(echo "${response}" | jq -r '.[]' | grep "${BUCKET_NAME_FILTER}")
# prints the result and save it in a file
echo "${OUTPUT}" | tee ${OUTPUT_FILE}
