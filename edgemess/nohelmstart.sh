#!/bin/bash

kubectl apply -f edgemess/templates/keycloak/keycloak-service.yaml
kubectl apply -f edgemess/templates/keycloak/keycloak.yaml
kubectl apply -f edgemess/templates/nextcloud/nextcloud-service.yaml
kubectl apply -f edgemess/templates/nextcloud/nextcloud.yaml
kubectl apply -f edgemess/templates/postgres/postgres-service.yaml
kubectl apply -f edgemess/templates/postgres/configmap.yaml
kubectl apply -f edgemess/templates/postgres/secret.yaml
kubectl apply -f edgemess/templates/postgres/statefulset.yaml
kubectl apply -f edgemess/templates/redis/redis-service.yaml
kubectl apply -f edgemess/templates/redis/redis.yaml
kubectl apply -f edgemess/templates/ingress.yaml
