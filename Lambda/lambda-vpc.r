

*************
Lambda in VPC
*************
    - Lambda lunches lambda in another VPC owned by AWS and not on ur default VPC
    - Lambda thus, cant access resources in ur VPC but can access resources such as Dynamodb located in 
      the AWS VPC
    **********
    VPC access
    **********
        - Define VPC ID, Subnet and security group
        - Lambda creates an ENI in ur subnets
        - Create AWSLambdaVPCAccessExecutionRole
        - Lambda goes through the ENI to access resources in ur VPC subnets
    - Deploying a Lambda funcion in a public subnet does not give it internet access or public IP
    - Deploy in a private subnet and attach a NATGateway to it
    - Use a NAT device to access Dynamodb or VPC endpoint
    - CloudWatch logs will work no matter were the Lambda function is hosted