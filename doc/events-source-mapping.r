

****************************
Lambda event source mappings
****************************
    - synchronous invocation of lambda (This is because the lambda service reads the queue and invokes your
      function synchronously)
    - An event source mapping is a Lambda resource that reads from an event source and invokes a Lambda 
      function
    - You can use event source mappings to process items from a stream or queue in services that dont invoke 
      Lambda functions directly
    - Lambda provides event source mappings for the following services
    **************************************
    Services that Lambda reads events from
    **************************************
        - Amazon DynamoDB
        - Amazon Kinesis
        - Amazon MQ
        - Amazon Managed Streaming for Apache Kafka (Amazon MSK)
        - Self-managed Apache Kafka
        - Amazon Simple Queue Service (Amazon SQS)
    
    - To manage an event source with the AWS Command Line Interface (AWS CLI) or an AWS SDK, you can use the 
      following
    **************
    API operations
    **************
        - CreateEventSourceMapping
        - ListEventSourceMappings
        - GetEventSourceMapping
        - UpdateEventSourceMapping
        - DeleteEventSourceMapping
    - The following example uses the AWS CLI to map a function named my-function to a DynamoDB stream that its 
      Amazon Resource Name (ARN) specifies, with a batch size of 500.
        aws lambda create-event-source-mapping --function-name my-function --batch-size 500 --maximum-batching-window-in-seconds 5 --starting-position LATEST \
        --event-source-arn arn:aws:dynamodb:us-east-2:123456789012:table/my-table/stream/2019-06-10T19:26:16.525
    You should see the following output

    {
        "UUID": "14e0db71-5d35-4eb5-b481-8945cf9d10c2",
        "BatchSize": 500,
        "MaximumBatchingWindowInSeconds": 5,
        "ParallelizationFactor": 1,
        "EventSourceArn": "arn:aws:dynamodb:us-east-2:123456789012:table/my-table/stream/2019-06-10T19:26:16.525",
        "FunctionArn": "arn:aws:lambda:us-east-2:123456789012:function:my-function",
        "LastModified": 1560209851.963,
        "LastProcessingResult": "No records processed",
        "State": "Creating",
        "StateTransitionReason": "User action",
        "DestinationConfig": {},
        "MaximumRecordAgeInSeconds": 604800,
        "BisectBatchOnFunctionError": false,
        "MaximumRetryAttempts": 10000
    }

        *****************************************
        Streams and Lambda (Kinesis and Dynamodb)
        *****************************************
            - Event source mapping creates an iterator for each shard and processes them in order
            - Processed items are not removed from the stream, other consumers can read them
            - Process up to 10 batches in parallel
            - If the function returns an error, this can block the function. The function will do the following
                - Discard old events to a destination
                - Restrict the number of retries
                - Split the batch on error
        ****************
        SQS and SQS Fifo
        ****************
            - Event source mapping will pull SQS long polling
            - Specify a batch size 1-10
            - Set queue visibility timeout to 6 x that of ur lambda function
            - To use DLQ
                - Set up on the SQS queue not lambda (DLQ for lambda is only for asynchronous invocations)
                - Use lambda destinations for failure
        ****************************
        Lambda event mapper scaling
        ****************************
            ****************************
            Kinesis and dynamodb streams
            ****************************
                - One lambda invocation per shard stream
                - 10 batches process in parallel per shard
            ******************
            SQS standard queue
            ******************
                - Lambda adds 60 more instances to scale up
                - Up to 1000 batches of message processed simultaneously
            ********
            SQS Fifo
            ********
                - Msg with same GroupId will be processed on order
                - Scales to the number of active messages
***
SNS
***
    - SNS does not require source mapping because its asynchronous
    - For asynchronous invocation, Lambda queues the message and handles retries
    - If Amazon SNS cant reach Lambda or the message is rejected, Amazon SNS retries at increasing intervals 
      over several hours
    - You can use a Lambda function to process Amazon Simple Notification Service (Amazon SNS) notifications
    - Amazon SNS supports Lambda functions as a target for messages sent to a topic. You can subscribe your 
      function to topics in the same account or in other AWS accounts
