

*****************
EventBridge Event
*****************
    - The eventBridge event types helps setting up AWS Lambda functions to react to events coming in via the 
      EventBridge
    - EventBridge (CloudWatch Events) helps you to respond to state changes in your AWS resources
    - When your resources change state, they automatically send events into an event stream. With EventBridge 
      (CloudWatch Events), you can create rules that match selected events in the stream and route them to your 
      AWS Lambda function to take action
    - EventBridge (CloudWatch Events) invokes your function asynchronously with an event document that wraps 
      the event from its source
    - The following example shows an event that originated from a database snapshot in Amazon Relational 
      Database Service.