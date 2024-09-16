#!/bin/bash

# install minikube for MacOS
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-darwin-arm64
sudo install minikube-darwin-arm64 /usr/local/bin/minikube

minikube start
alias k="minikube kubectl --"

# Enable the Ingress controller on minikube
minikube addons enable ingress

#install helm
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh