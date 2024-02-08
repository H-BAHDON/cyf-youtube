# cyf-youtube
 


[![Deploy to S3](https://github.com/H-BAHDON/cyf-youtube/actions/workflows/frontend-s3-deploy.yml/badge.svg?branch=main)](https://github.com/H-BAHDON/cyf-youtube/actions/workflows/frontend-s3-deploy.yml)
[![Deploy Backend to EC2](https://github.com/H-BAHDON/cyf-youtube/actions/workflows/backend-ec2-deploy.yml/badge.svg)](https://github.com/H-BAHDON/cyf-youtube/actions/workflows/backend-ec2-deploy.yml)


project/
|-- server/
|   |-- main.tf          # Main configuration for the server environment
|   |
|   |-- modules/
|       |-- ec2/
|       |   |-- main.tf       # EC2 specific configuration
|       |   |-- variables.tf
|       |   |-- outputs.tf
|       |
|       |-- rds/
|           |-- main.tf       # RDS specific configuration
|           |-- variables.tf
|           |-- outputs.tf
|
|-- common/
    |-- shared_variables.tf  # Shared variables (e.g., AWS region)
    |-- shared_outputs.tf   # Shared outputs (if needed)