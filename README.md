# Utilities via CLI

Playing with scripts.

- [Utilities via CLI](#utilities-via-cli)
  - [Usage examples](#usage-examples)
    - [Getting the list of AWS S3 buckets:](#getting-the-list-of-aws-s3-buckets)
    - [Checking if a tag exists in an AWS S3 Bucket:](#checking-if-a-tag-exists-in-an-aws-s3-bucket)
    - [Getting AWS S3 bucket details](#getting-aws-s3-bucket-details)
    - [Getting AWS S3 bucket lock config](#getting-aws-s3-bucket-lock-config)
    - [Getting AWS S3 object details](#getting-aws-s3-object-details)

## Usage examples

### Getting the list of AWS S3 buckets:
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

### Getting AWS S3 bucket details

```shell
BUCKET_NAME='bucket-name' ./bin/aws-s3-get-bucket-details.sh
```

### Getting AWS S3 bucket lock config

```shell
BUCKET_NAME='bucket-name' ./bin/aws-s3-get-bucket-lock-config.sh
```

### Getting AWS S3 object details

```shell
# Folders
BUCKET_NAME='bucket-name' OBJECT_KEY='my/folder/' ./bin/aws-s3-get-object-details.sh

# Files
BUCKET_NAME='bucket-name' OBJECT_KEY='my/folder/file.txt' ./bin/aws-s3-get-object-details.sh
```

<!-- TODO: add examples of how to run the script directly via GitHub raw content URL -->
