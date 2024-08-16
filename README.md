# Utilities via CLI

Playing with scripts.

## Usage examples

### Checking if a tag exists in an AWS S3 Bucket

1. Get the list of buckets:
```shell
# It will create a '/tmp/utils-cli-bin-aws-s3-list-bucket-names.log' by default
./bin/aws-s3-list-bucket-names.sh

# Changing the output file
BUCKETS_LIST_FILE=output.txt ./bin/aws-s3-list-bucket-names.sh
```

2. Edit the output file in order to have only one bucket name per line:
```text
bucket-1
another-bucket
my-bucket-02
```

3. Check the desired tag against the bucket list:

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

