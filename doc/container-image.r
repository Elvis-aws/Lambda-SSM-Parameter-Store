

*************
Node.js image
*************
"""
FROM amazon/aws-lambda-nodejs:12
COPY app.js package*.json ./
RUN npm install
CMD [ "app.lambdaHandler" ]
"""

************
Python image
************
- Install any dependencies under the ${LAMBDA_TASK_ROOT} directory alongside the function handler to ensure 
  that the Lambda runtime can locate them when the function is invoked
"""
FROM public.ecr.aws/lambda/python:3.8

# Install the function's dependencies using file requirements.txt
# from your project folder.

COPY requirements.txt  .
RUN  pip3 install -r requirements.txt --target "${LAMBDA_TASK_ROOT}"

# Copy function code
COPY app.py ${LAMBDA_TASK_ROOT}

# Set the CMD to your handler (could also be done as a parameter override outside of the Dockerfile)
CMD [ "app.handler" ]
"""