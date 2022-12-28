


**********
Lambda DLQ
**********
    - You can now configure a dead letter queue (DLQ) on AWS Lambda to give you more control over message 
      handling for all asynchronous invocations, including those delivered via AWS events (S3, SNS, IoT, 
      etc)
    - You can setup a DLQ by configuring the 'DeadLetterConfig' property when creating or updating your 
      Lambda function
    - You can provide an SQS queue or an SNS topic as the 'TargetArn' for your DLQ, and AWS Lambda will 
      write the event object invoking the Lambda function to this endpoint after the standard retry policy 
      (2 additional retries on failure) is exhausted