
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

{
    "version": "0",
    "id": "fe8d3c65-xmpl-c5c3-2c87-81584709a377",
    "detail-type": "RDS DB Instance Event",
    "source": "aws.rds",
    "account": "123456789012",
    "time": "2020-04-28T07:20:20Z",
    "region": "us-east-2",
    "resources": [
        "arn:aws:rds:us-east-2:123456789012:db:rdz6xmpliljlb1"
    ],
    "detail": {
        "EventCategories": [
            "backup"
        ],
        "SourceType": "DB_INSTANCE",
        "SourceArn": "arn:aws:rds:us-east-2:123456789012:db:rdz6xmpliljlb1",
        "Date": "2020-04-28T07:20:20.112Z",
        "Message": "Finished DB Instance backup",
        "SourceIdentifier": "rdz6xmpliljlb1"
    }
}