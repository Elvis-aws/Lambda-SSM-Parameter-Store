

***********
Lambda@Edge
***********
    **********************
    Synchronous invocation
    **********************
        - Data traffic on the modern Internet is growing rapidly
        - You can not use the latest or alias but only the number version of lambda
        - Max memory size of 128 MB and timeout of 5 seconds (for viewer request and response)
        - To keep up with this growth, website and application owners have turned to CDNs (Content Delivery Networks) 
          like Amazon CloudFront to cache web content on geographically dispersed servers located at edge locations 
          around the world
        - End users can expect faster load times and less load on the origin server
        - But what if you need to bring the code and its computing closer to your user? This is where Lambda@Edge 
          can help
        ***********************************************
        What does this Amazon Web Services Solution do?
        ***********************************************
            - Lambda@Edge is a feature of Amazon CloudFront that lets you run code closer to users of your application, 
              which improves performance and reduces latency
            - With Lambda@Edge, you dont have to provision or manage infrastructure in multiple locations around 
              the world
            - This solution offers a collection of Lambda@Edge applications, covering most common Lambda@Edge user 
              scenarios
        *********************************************************
        CloudFront events that can be used to trigger Lambda@Edge
        *********************************************************
            Your functions will automatically trigger in response to the following Amazon CloudFront events:
                - Viewer Request
                    This event occurs when an end-user or a device on the Internet makes an HTTP(S) request to 
                    CloudFront, and the request arrives at the edge location closest to that user
                - Viewer Response
                    This event occurs when the CloudFront server at the edge is ready to respond to the end-user 
                    or the device that made the request
                - Origin Request
                    This event occurs when the CloudFront edge server does not already have the requested object 
                    in its cache, and the viewer request is ready to be sent to your backend origin web server 
                    (e.g. Amazon EC2 or Amazon S3)
                - Origin Response
                    This event occurs when the CloudFront server at the edge receives a response from your backend 
                    origin web server
        *********************
        Lambda@Edge use cases
        *********************
            **************
            - Performance
            **************
                - One of the biggest benefits of using Lambda@Edge is to improve cache hit rates
                - You can add or modify cache control headers on responses
                - Dynamically route to different origins based on attributes of request headers, cookies, or query 
                  strings
            *****************
            - Dynamic Content
            *****************
                - With Lambda@Edge, you can dynamically generate content based on request or response attributes
                - Resize images based on request attributes
                - Do A/B testing
                - Generate a 302/301 redirection response for all requests to an expired or outdated resource
            **********
            - Security
            **********
                - Lambda@Edge can also be used to handle custom authentication and authorization