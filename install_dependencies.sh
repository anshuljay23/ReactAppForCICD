#!/bin/bash
# Install Docker if it's not already installed
if ! [ -x "$(command -v docker)" ]; then
  echo "Installing Docker"
  yum update -y
  amazon-linux-extras install docker
  service docker start
  usermod -a -G docker ec2-user
  chmod 666 /var/run/docker.sock
else
  echo "Docker is already installed"
fi
