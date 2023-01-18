

************
Dependencies
************
    - If ur function depends on external libraries, u need to install the packages along side your code
      and zip them all together
    - Upload the zip file if less than 50 MB else to S3 and point lambda to the S3 bucket
    - Native libraries work but they need to be compile on amazon linux
        - Cloud formation
            - You can create Lambda functions by using cloudformation templates but for very simple 
              functions as this template does not reference dependencies
        - Cloud formation through S3
            - Store Lambda zip in S3
            - Refer the S3 zip location in the CloudFormation code
                - S3Bucket
                - S3Key:full path to zip
                - S3objectVersion:if bucket is versioned (Versioning is very important so that if you 
                  update the file and specify the new version, cloudformation will pick up the new change)
        - Lambda and Cloud formation- through S3 multiple accounts
            - If we have an S3 bucket with Lambda code in account 1, we can add account 2 and 3 as 
              principles in the bucket policy
            - Create Cloud formation templates in account 2,3 and add lambda execution roles for S3 
              account 1