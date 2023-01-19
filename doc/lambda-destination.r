

*******************
Lambda destinations
*******************
    - When a function is invoked asynchronously, Lambda sends the event to an internal queue
    - A separate process reads events from the queue and executes your Lambda function
    - When the event is added to the queue, Lambda previously only returned a 200 status code to confirm that
      the queue has received this event
    - There was no additional information to confirm whether the event had been processed successfully
    - With Destinations, you can route asynchronous function results as an execution record to a destination 
      resource without writing additional code
    - An execution record contains details about the request and response in JSON format including version, 
      timestamp, request context, request payload, response context, and response payload 
    - For each execution status such as Success or Failure you can choose one of four destinations
        - another Lambda function
        - SNS
        - SQS
        - EventBridge
    - Lambda can also be configured to route different execution results to different destinations
    - Allows for both success and failure 