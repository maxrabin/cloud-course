#!/bin/bash +ex

WEBSITE_DOMAIN_NAME=`jq -r .WebsiteDomainName < ../config.json`
STACK_NAME=`jq -r .CloudformationStackName < ../config.json`

echo Cloudformation Deploy...
VPC_ID=$(aws ec2 describe-vpcs --query 'Vpcs[*].[VpcId]' --output text)
SUBNET_IDS=$(aws ec2 describe-subnets --filters Name=vpc-id,Values=$VPC_ID --query 'Subnets[*][SubnetId]' --output text | paste -sd "," -)
echo VPC_ID=$VPC_ID
echo SUBNET_IDS=$SUBNET_IDS
aws cloudformation deploy \
    --template-file ./template.yaml \
    --capabilities CAPABILITY_IAM \
    --parameter-overrides \
       WebsiteDomainName=$WEBSITE_DOMAIN_NAME \
       VpcId=$VPC_ID \
       SubnetIds=$SUBNET_IDS \
    --stack-name $STACK_NAME

echo Sync Website Files...
aws s3 sync frontend s3://$WEBSITE_DOMAIN_NAME/

echo Outputs...
aws cloudformation describe-stacks --stack-name $STACK_NAME --query 'Stacks[0].Outputs' --output yaml
