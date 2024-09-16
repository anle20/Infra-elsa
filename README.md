# Infra-elsa

## Install jenkins-operator with helm

```bash

helm repo add jenkins https://raw.githubusercontent.com/jenkinsci/kubernetes-operator/master/chart

helm install jenkins jenkins/jenkins-operator -n jenkins-operator

1. Watch Jenkins instance being created:
$ kubectl --namespace jenkins-operator get pods -w

2. Get Jenkins credentials:
$ kubectl get secret jenkins-operator-credentials-jenkins -o 'jsonpath={.data.user}' | base64 -d
$ kubectl get secret jenkins-operator-credentials-jenkins -o 'jsonpath={.data.password}' | base64 -d

3. Connect to Jenkins (actual Kubernetes cluster):
$ kubectl port-forward jenkins-jenkins 8080:8080
```

Now open the browser and enter http://localhost:8080

Optionally, you can also visit jenkins-elsa.example from your browser.

Add a line to the bottom of the /etc/hosts file on your computer (you will need administrator access):
```bash
127.0.0.1 jenkins-elsa.example
127.0.0.1 hackathon-elsa.example
$ minikube tunnel
```
Now open the browser and enter jenkins-elsa.example