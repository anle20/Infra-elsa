# Infra-elsa

## Getting Started

```bash
cd script
./setup.sh # Install all dependencies
./deploy.sh # Deploy Jenkins and ingress

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