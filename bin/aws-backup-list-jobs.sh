#!/bin/bash

# For log purpose (e.g., when run remotely via GitHub raw content URL)
SERVICE=utils-cli-bin-aws-backup-list-jobs

# Set the job creation date in the format YYYY-MM-DD
DEFAULT_CREATION_DATE=$(date -v-1d +%F) # today - 1
BACKUP_JOBS_CREATION_DATE="${BACKUP_JOBS_CREATION_DATE:-${DEFAULT_CREATION_DATE}}"

# Filter/regex. Defaults to all (no filter).
BACKUP_JOBS_FILTER=${BACKUP_JOBS_FILTER:-FAILED}

# Set the fields to be displayed
BACKUP_JOBS_FIELDS=${BACKUP_JOBS_FIELDS:-'BackupJobId, CreationDate, State, BackupVaultName, ResourceType, ResourceName'}

# Output
OUTPUT_FILE=${OUTPUT_FILE:-/tmp/utils-cli-bin-aws-s3-list-bucket-names.log}
OUTPUT=

# Main command. List backup jobs.
response=$(aws backup list-backup-jobs --query "BackupJobs[?CreationDate>='${BACKUP_JOBS_CREATION_DATE}'].[${BACKUP_JOBS_FIELDS}]" --output text --no-cli-pager)
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
# applies the filter to the output
OUTPUT=$(echo "${response}" | grep -E "${BACKUP_JOBS_FILTER}")
# prints the result and save it in a file
echo "List of backup jobs since '${BACKUP_JOBS_CREATION_DATE}' filtered by '${BACKUP_JOBS_FILTER}':"
echo
echo "${OUTPUT}" | tee ${OUTPUT_FILE}

echo
echo "Output saved to: '${OUTPUT_FILE}'"
