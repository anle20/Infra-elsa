#!/bin/bash

#Create sa and rolebinding for jenkins
k apply -f ../jenkins-service-account.yaml
k apply -f ../jenkins-role.yaml
k apply -f ../jenkins-rolebinding.yaml

#install jenkins
helm repo add jenkins https://raw.githubusercontent.com/jenkinsci/kubernetes-operator/master/chart
helm install jenkins jenkins/jenkins-operator -n jenkins-operator

#get secret
k get secret jenkins-operator-credentials-jenkins -o 'jsonpath={.data.user}' | base64 -d
k get secret jenkins-operator-credentials-jenkins -o 'jsonpath={.data.password}' | base64 -d

kubectl port-forward jenkins-jenkins 8080:8080

#create ingress
k apply -f ../example-ingress.yaml
