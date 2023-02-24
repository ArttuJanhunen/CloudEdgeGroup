#!/bin/bash

kubectl apply -f edgemess/templates/keycloak
kubectl apply -f edgemess/templates/nextcloud
kubectl apply -f edgemess/templates/postgres
kubectl apply -f edgemess/templates/redis
kubectl apply -f edgemess/templates/ingress.yaml
kubectl apply -f edgemess/templates/mariadb
