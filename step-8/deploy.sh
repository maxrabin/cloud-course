#!/bin/bash

WEBSITE_DOMAIN_NAME=`jq -r .WebsiteDomainName < ../config.json`
STACK_NAME=`jq -r .CloudformationStackName < ../config.json`

echo Cloudformation Deploy...
aws cloudformation deploy \
    --template-file ./template.yaml \
    --capabilities CAPABILITY_IAM \
    --parameter-overrides WebsiteDomainName=$WEBSITE_DOMAIN_NAME \
    --stack-name $STACK_NAME

echo Outputs...
aws cloudformation describe-stacks --stack-name $STACK_NAME --query 'Stacks[0].Outputs' --output yaml
