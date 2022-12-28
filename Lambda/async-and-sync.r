



***********************
Synchronous invocation
***********************
    - No error handling
    - Each function is involked after the other 
    - We need to wait for the results before we proceed to the next function 
    - Your application has to handle any retries due to failures
    - 

***********************
Asynchronous invocation
***********************
    - Asynchronous invocation implies function is invocked but we do not know the results
        - S3, SNS,SQS, Lambda, CloudWatch Events
        - The events are placed in event queues
        - lambda attempts to re-try
        - Make sure your lambda function is idempotent
            - (Even without database failures, if were using non-idempotent APIs, we may run into issues 
               because events delivered by AWS services such as SQS, EventBridge and Kinesis to Lambda have 
               “at least once” delivery. This means that Lambda functions or other systems subscribed to these 
               sources may end up receiving a message twice, sometimes within a few milliseconds of each other)
            - Resolve Idempotency in Lambda
                - Extract the value of a unique attribute of the input event. (For example, a transaction or 
                  purchase ID)
                - Check if the attribute value exists in a control database (such as an Amazon DynamoDB table)
                - If a unique value exists (indicating a duplicated event), gracefully terminate the execution 
                  (that is, without throwing an error). If a unique value doesn’t exist, continue the execution 
                  normally
                - When the function work finishes successfully, include a record in the control database
                - Finish the execution
        - Duplicate log entries will be seen in cloudwatch log incase of retries
        - DLQ will be needed to process the failed events.
            - When we invoke a function asynchronously, we do not get the results but just the status code that 
              the functionwas successfully invoked
            - We thus need a DLQ to capture any failed invokations 
            - We can always configure a number of retries before sending to our DLQ in SQS
    
