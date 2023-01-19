

*********************
Lambda execution role
*********************
     - A Lambda functions execution role is an AWS Identity and Access Management (IAM) role that grants the 
       function permission to access AWS services and resources. For example, you might create an execution role 
       that has permission to send logs to Amazon CloudWatch and upload trace data to AWS X-Ray
     - You provide an execution role when you create a function
     - When you invoke your function, Lambda automatically provides your function with temporary credentials by 
       assuming this role
     - You dont have to call sts:AssumeRole in your function code

     ************
     Trust Policy
     ************
            -  A roles trust policy gives the specified principals permission to assume the role. In the following
               example, you grant the Lambda service principal permission to assume your role.

                {
                  "Version": "2012-10-17",
                  "Statement": [
                    {
                      "Effect": "Allow",
                      "Principal": {
                        "Service": "lambda.amazonaws.com"
                      },
                      "Action": "sts:AssumeRole"
                    }
                  ]
                }
     ******
     Policy
     ******
            - Once the role is created, you can then attach a policy to the role as below
            {
                "Version": "2012-10-17",
                "Statement": [
                    {
                        "Sid": "ExampleSourceFunctionArn",
                        "Effect": "Allow",
                        "Action": "s3:PutObject",
                        "Resource": "arn:aws:s3:::lambda_bucket/*",
                        "Condition": {
                            "ArnEquals": {
                                "lambda:SourceFunctionArn": "arn:aws:lambda:us-east-1:123456789012:function:source_lambda"
                            }
                        }
                    }
                ]
            }

**************************************
Identity-based IAM policies for Lambda
**************************************
    - You can use identity-based policies in AWS Identity and Access Management (IAM) to grant users in your 
      account access to Lambda
    - Identity-based policies can apply to users directly, or to groups and roles that are associated with a 
      user
    - You can also grant users in another account permission to assume a role in your account and access your 
      Lambda resources
**********************************
Resource-based policies for Lambda
**********************************
    - Lambda supports resource-based permissions policies for Lambda functions and layers
    - Resource-based policies let you grant usage permission to other AWS accounts or organizations on a 
      per-resource basis
    - You also use a resource-based policy to allow an AWS service to invoke your function on your behalf
{
    "Version": "2012-10-17",
    "Id": "default",
    "Statement": [
        {
            "Sid": "lambda-allow-s3-my-function",
            "Effect": "Allow",
            "Principal": {
              "Service": "s3.amazonaws.com"
            },
            "Action": "lambda:InvokeFunction",
            "Resource":  "arn:aws:lambda:us-east-2:123456789012:function:my-function",
            "Condition": {
              "StringEquals": {
                "AWS:SourceAccount": "123456789012"
              },
              "ArnLike": {
                "AWS:SourceArn": "arn:aws:s3:::my-bucket"
              }
            }
        }
     ]
}