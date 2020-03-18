# Infrastructure

export AWS_PROFILE=dev/prod

To create cloudformation using sh command which will create Stack, VPC, SUBNETS, RDS, EC2INSTANCE, SECURITY GROUPS

    - parameters
        - STACK NAME
        - AWS region
        - VPC CIDR block
        - Subnets CIDR block
        - VPC name
        - AMIID
        - ACCESS KEYS
        - Domain Name
        - KeyPair value
        

        - sh createapplication-stack.sh newStack newVPC2 us-east-2 10.0.0.0/16 10.0.0.0/18 10.0.64.0/18 10.0.128.0/17 ami-0fa92182779792f95 newStack_RhfydhufhH453cfb AKIAQU2IXZNOFUQI6WLY 0tSh7IbGBQQO0nKThRmf/vQbQgst16qsUZw9dC8B sharwarigothe.me ec2instanceKeyPair

To terminate stack along with entire cloudformation

    - sh terminateapplication-stack.sh newStac us-east-1

    - termination command specifies the stack name and region in which the infrastructure should be built

Cloudwatch policies attached to cloudformation