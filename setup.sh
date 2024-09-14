#!/bin/bash

# install minikube for MacOS
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-darwin-arm64
sudo install minikube-darwin-arm64 /usr/local/bin/minikube

minikube start
alias k="minikube kubectl --"

# Enable the Ingress controller on minikube
minikube addons enable ingress

#Enable tunnel 
