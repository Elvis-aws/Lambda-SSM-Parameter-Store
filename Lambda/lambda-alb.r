

**********
Lambda ALB
**********
    - Lambda funcion must be registered in a target group
    - Client can send HTTP/HTTPS requests to ALB
    - ALB invokes lambda synchronously
    - The HTTP request gets transfered into a Json document
    - Multi-header-value
        - ALB supports MHV settings
        - HTTP headers and query string parameters that are sent get transformed into an array
            - http://example.com/path?name=foo&name=bar
            - QueryStringParameters:{name:["foo","bar"]}