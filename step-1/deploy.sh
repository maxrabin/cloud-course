#!/bin/bash

WEBSITE_DOMAIN_NAME=`jq -r .WebsiteDomainName < ../config.json`
STACK_NAME=`jq -r .CloudformationStackName < ../config.json`

echo Cloudformation Deploy...
aws cloudformation deploy \
    --template-file ./template.yaml \
    --parameter-overrides WebsiteDomainName=$WEBSITE_DOMAIN_NAME \
    --stack-name $STACK_NAME

echo Sync Website Files...
aws s3 sync frontend s3://$WEBSITE_DOMAIN_NAME/
