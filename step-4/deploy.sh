#!/bin/bash

WEBSITE_DOMAIN_NAME=`jq -r .WebsiteDomainName < ../config.json`
STACK_NAME=`jq -r .CloudformationStackName < ../config.json`

DEVOPS_BUCKET_NAME=devops-`aws sts get-caller-identity | jq -r .Account`-`aws configure get region`

#Creates Devlops bucket if it doesn't exist
aws s3api head-bucket --bucket $DEVOPS_BUCKET_NAME \
    || aws s3 mb s3://$DEVOPS_BUCKET_NAME && \
       aws s3api wait bucket-exists \
            --bucket $DEVOPS_BUCKET_NAME

echo Cloudformation Deploy...
sam build \
    --template-file ./template.yaml

sam deploy \
    --s3-bucket $DEVOPS_BUCKET_NAME \
    --s3-prefix $STACK_NAME/ \
    --stack-name $STACK_NAME \
    --capabilities CAPABILITY_NAMED_IAM \
    --parameter-overrides WebsiteDomainName=$WEBSITE_DOMAIN_NAME \

echo Sync Website Files...
aws s3 sync frontend s3://$WEBSITE_DOMAIN_NAME/

echo "Invoke the Lambda:"
aws lambda invoke \
    --function-name MyLambdaFunction \
    --invocation-type RequestResponse \
    response.json > /dev/null \
    && jq -r . < response.json \
    && rm response.json
