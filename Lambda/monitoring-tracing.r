

***************
CloudWatch Logs
***************
    - Lambda execution logs are stored in ClodWatch logs
*****************
CloudWatch Metrix
*****************
    - Invocation, duration, concurrent execution
    - Throttle, error and success counts
    - Iterator age
*****
X-Ray
*****
    - Enable in Lambda configuration (Active tracing)
    - Runs the x-ray demon automatic for u _X_AMZN_TRACE_ID
        - The X-Ray tracing header
            - This environment variable is not defined for custom runtimes (for example, runtimes that use 
              the provided or provided.al2 identifiers)
            - You can set _X_AMZN_TRACE_ID for custom runtimes using the Lambda-Runtime-Trace-Id response 
              header from the Next invocation
    - AWS_XRAY_CONTEXT_MISSING
        - For X-Ray tracing
            - Lambda sets this to LOG_ERROR to avoid throwing runtime errors from the X-Ray SDK
    - AWS_XRAY_DAEMON_ADDRESS
        - For X-Ray tracing
            - The IP address and port of the X-Ray daemon