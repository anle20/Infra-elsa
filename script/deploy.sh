#!/bin/bash

#Create sa and rolebinding for jenkins
kubectl apply -f ../jenkins-service-account.yaml
kubectl apply -f ../jenkins-role.yaml
kubectl apply -f ../jenkins-rolebinding.yaml

#install jenkins
helm repo add jenkins https://raw.githubusercontent.com/jenkinsci/kubernetes-operator/master/chart
helm install jenkins jenkins/jenkins-operator -n jenkins-operator

#get secret
kubectl get secret jenkins-operator-credentials-jenkins -o 'jsonpath={.data.user}' | base64 -d
kubectl get secret jenkins-operator-credentials-jenkins -o 'jsonpath={.data.password}' | base64 -d
