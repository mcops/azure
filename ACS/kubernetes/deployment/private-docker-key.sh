#!/bin/bash

##
## https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/
##
DOCKER_USER=""
DOCKER_PASSWORD=""
DOCKER_EMAIL=""


docker login -u $DOCKER_USER -p $DOCKER_PASSWORD
#
sleep 2
#
kubectl create secret docker-registry regsecret \
  --docker-server=https://index.docker.io/v1/ \
  --docker-username=$DOCKER_USER \
  --docker-password=$DOCKER_PASSWORD \
  --docker-email=$DOCKER_EMAIL

kubectl get secret regsecret --output=yaml
