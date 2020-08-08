#!/bin/bash

WEBSITE_DOMAIN_NAME=`jq -r .WebsiteDomainName < ../config.json`

aws cloudformation deploy \
    --template-file ./template.yaml \
    --parameter-overrides WebsiteDomainName=$WEBSITE_DOMAIN_NAME \
    --stack-name `jq -r .CloudformationStackName < ../config.json`

aws s3 sync frontend s3://$WEBSITE_DOMAIN_NAME/
