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
        - Bucket name(file)
        - Bucket name (codedeploy)
        - ACCESS KEYS

        - sh createapplication-stack.sh newStack newVPC2 us-east-2 10.0.0.0/16 10.0.0.0/18 10.0.64.0/18 10.0.128.0/17 ami-0fa92182779792f95 newStack_hfydhufhh codedeploy.sharwarigothe.me AKIAQU2IXZNOFUQI6WLY 0tSh7IbGBQQO0nKThRmf/vQbQgst16qsUZw9dC8B

To terminate stack along with entire cloudformation

    - sh terminateapplication-stack.sh newStac us-east-1

    - termination command specifies the stack name and region in which the infrastructure should be built