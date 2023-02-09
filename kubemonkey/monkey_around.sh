#!/bin/bash

kubectl apply -f kubemonkey/debug-mode-configmap.yaml
kubectl apply -f kubemonkey/deployment.yaml
