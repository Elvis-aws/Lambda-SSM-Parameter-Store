#! Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
#  SPDX-License-Identifier: MIT-0
import time
import boto3

client = boto3.client('athena')


def lambda_handler(event, context):
    start_query_response = client.start_query_execution(
        QueryString=event['dbQuery'],
        QueryExecutionContext={'Database': event['dbName']},
        ResultConfiguration={'OutputLocation': event['s3OutputLocation']}
    )
    print(start_query_response)
    # Added sleep to wait till the execution is fully completed
    time.sleep(2)
    query_execution_id = start_query_response['QueryExecutionId']

    while True:
        finish_state = client.get_query_execution(QueryExecutionId=query_execution_id)[
            "QueryExecution"
        ]["Status"]["State"]
        if finish_state == "RUNNING" or finish_state == "QUEUED":
            print(f'Query is queued or still {finish_state}')
            time.sleep(5)
        else:
            print(f'Query {finish_state}')
            break

    get_query_results_response = client.get_query_results(QueryExecutionId=query_execution_id)
    print(get_query_results_response)
    return {
        'statusCode': 200,
        'body': 'OK'
    }
