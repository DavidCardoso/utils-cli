# Utilities via CLI

Playing with scripts.

## Usage examples

### Getting the list of buckets:
```shell
# It will create a '/tmp/utils-cli-bin-aws-s3-list-bucket-names.log' by default
./bin/aws-s3-list-bucket-names.sh

# Changing the output file
BUCKETS_LIST_FILE=output.txt ./bin/aws-s3-list-bucket-names.sh

# Filtering the output
BUCKET_NAME_FILTER='^some-prefix' ./bin/aws-s3-list-bucket-names.sh
```

### Checking if a tag exists in an AWS S3 Bucket:

```shell
# Defaults to TAG_NAME=backup_tier TAG_VALUE=class_a BUCKETS_LIST_FILE=/tmp/utils-cli-bin-aws-s3-list-bucket-names.log
./bin/aws-s3-check-bucket-tag.sh
# Buckets with tag 'backup_tier=class_a':
# ❌ bucket-1
# ❌ another-bucket
# ✅ my-bucket-02

# Checking another tag
TAG_NAME=tag TAG_VALUE=value ./bin/aws-s3-check-bucket-tag.sh

# Using another file
BUCKETS_LIST_FILE=output.txt ./bin/aws-s3-check-bucket-tag.sh
```

