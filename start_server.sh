#!/bin/bash
# Stop the running container
docker stop $(docker ps -q) || true

# Remove the stopped container
docker rm $(docker ps -a -q) || true

# Pull the latest image from ECR
docker pull <your_ecr_repository>.dkr.ecr.<your-region>.amazonaws.com/<your_ecr_repository>:latest

# Run the container
docker run -d -p 80:80 <your_ecr_repository>.dkr.ecr.<your-region>.amazonaws.com/<your_ecr_repository>:latest
