

************
Lambda Layer
************
    - Works very similarly to a folder containing a library in a function code
    - The difference is that, instead of having to package this library within the function code, it can 
      be packaged separately
    - Lambda will load the Layer together with the function when its invoked
        - Re-use code across multiple functions
            - Isolating common features in Layers makes it easier to share the same codebase across 
              multiple functions
            - This avoids having to replicate the same code in different places, which is a bad practice
        - Keeping functions package code smaller
            - Having a large codebase per function can be a problem
            - It can make it more difficult to maintain and test the application, for example. It can make 
              deployment slower as well
        - Simplifies management and deployment of the main function
            - By keeping the functions package smaller, deployment times are faster
            - When using large dependencies, the main function code may have only a couple of megabytes, 
            while the entire package ends up with up to 50 MB
        - Dependencies do not change so why not keep them in external layers