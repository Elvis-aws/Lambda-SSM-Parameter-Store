

*************
Lambda Docker
*************
    - To deploy a container image to Lambda, you need the AWS CLI and Docker CLI
        - The container image must implement the Lambda Runtime API
        - The container image must be able to run on a read-only file system. Your function code can access a 
          writable /tmp directory with between 512 MB and 10,240 MB, in 1-MB increments, of storage
        - The default Lambda user must be able to read all the files required to run your function code
        - Lambda supports only Linux-based container images
        - Lambda provides multi-architecture base images. However, the image you build for your function must 
          target only one of the architectures. Lambda does not support functions that use multi-architecture 
          container images 
    - If the container does not implement the Lambda-Runtime-API, then run the container using FArgate