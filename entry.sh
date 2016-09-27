#!/usr/bin/env bash

ssh-keygen -A
adduser -s /bin/bash -D jenkins
echo "jenkins:$SSH_PASSWORD" | chpasswd

su - jenkins

echo "export JAVA_HOME=/opt/jdk" >> /etc/profile
echo "export M2_HOME=/usr/lib/mvn" >> /etc/profile
echo "export PATH=${PATH}" >> /etc/profile

exec "$@"
