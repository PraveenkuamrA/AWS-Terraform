#!/bin/bash

# Day 01 - What is a Pod and why it exists

# Step 1: Create a bare Pod called my-pod running nginx
# --restart=Never tells Kubernetes to create a bare Pod, not a Deployment
kubectl run my-pod --image=nginx --restart=Never

# Step 2: List all running Pods in the current namespace
kubectl get pods

# Step 3: Describe my-pod — IP, node, container details, events
kubectl describe pod my-pod
