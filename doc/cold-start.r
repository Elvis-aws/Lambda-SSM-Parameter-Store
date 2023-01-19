

**********
Cold start
**********
    - After a function is deployed, it starts receiving request, the service first prepares an execution 
      environment
    - During this step, the service downloads the code for the function, which is stored in an internal 
      Amazon S3 bucket or in Amazon ECR 
    - It then creates an environment with the memory, runtime, and configuration specified
    - Once complete, Lambda runs any initialization code outside of the event handler before finally 
      running the handler code
    *********************************************
    Manage cold start using provision concurrency
    *********************************************
        - Lambda execution environments handle one request at a time
        - After the invocation has ended, the execution environment is retained for a period of time
        - If another request arrives, the environment is reused to handle the subsequent request
        - If requests arrive simultaneously, the Lambda service scales up the Lambda function to provide 
          multiple execution environments
        - Each environment has to be set up independently, so each invocation experiences a full cold start
            - If you need predictable function start times for your workload, Provisioned Concurrency is 
              the recommended solution to ensure the lowest possible latency
            - This feature keeps your functions initialized and warm, ready to respond in double-digit 
              milliseconds at the scale you provision
            - Unlike on-demand Lambda functions, this means that all setup activities happen ahead of 
              invocation, including running the initialization code
        - You can use application Auto Scaling to manage concurrency