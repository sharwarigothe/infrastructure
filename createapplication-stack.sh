#!/bin/bash

#sh createapplication-stack.sh
# 1. applicationstack name 2. VPC NAme 3. AWS region 4. VPC cidr block 5. subnet cidr block

echo "Create the VPC .."


aws cloudformation describe-stacks --stack-name $1 --region $3 >/dev/null 2>&1
if [ $? -eq 0 ]
then
	echo "Failed: Stack with  name $1 already exists"
	exit
fi

status=$(aws cloudformation create-stack \
--stack-name $1 \
--template-body file://application.json \
--region $3 \
--parameters \
ParameterKey=vpcName,ParameterValue=$2 \
ParameterKey=region,ParameterValue=$3 \
ParameterKey=vpcCidrBlock,ParameterValue=$4 \
ParameterKey=subnet1CidrBlock,ParameterValue=$5 \
ParameterKey=subnet2CidrBlock,ParameterValue=$6 \
ParameterKey=subnet3CidrBlock,ParameterValue=$7 \
ParameterKey=AMIid,ParameterValue=$8 \
ParameterKey=ImageS3Bucket,ParameterValue=$9 \
ParameterKey=DeployS3Bucket,ParameterValue=$10 \
ParameterKey=awsaccesskeyid,ParameterValue=$11 \
ParameterKey=awssecretaccesskey,ParameterValue=$12 \
ParameterKey=DomainName,ParameterValue=$13 \
ParameterKey=keypairvalue,ParameterValue=$14 \
ParameterKey=Certificate,ParameterValue=$15 \
--capabilities CAPABILITY_NAMED_IAM \
--on-failure DELETE)

if [ $? -eq 0 ]
then
    echo "Waiting on $1 for create completion"
    aws cloudformation wait stack-create-complete --stack-name $1 --region $3
    if [ $? -eq 0 ]
    then
        echo "Stack has been created"
        echo $status
    else
        echo "Failed: Failed to deploy stack"
        echo $status
        exit
    fi
else
    echo "Failed: Failed to deploy stack"
    echo $status
    exit
fi