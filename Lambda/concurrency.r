

******************
Lambda concurrency
******************
    There are two types of concurrency controls available
        ********************
        Reserved concurrency
        ********************
            - Reserved concurrency guarantees the maximum number of concurrent instances for the function
            - When a function has reserved concurrency, no other function can use that concurrency
            - There is no charge for configuring reserved concurrency for a function
        ***********************
        Provisioned concurrency
        ***********************
            - Provisioned concurrency initializes a requested number of execution environments so that 
              they are prepared to respond immediately to your functions invocations
            - Note that configuring provisioned concurrency incurs charges to your AWS account