# Intro
NodeJs Helloworld deployable on CF & K8S (Kyma)  
https://kyma-project.io/docs/

Similar to:  
Hello World 3 Ways: ABAP, Cloud Foundry, and Kubernetes  
https://www.youtube.com/watch?v=lbJ2I964pfY&t=1317s



# Test Locally
## terminal
```shell
cd ../hello  
npm start  
```

## test
http://localhost:3000  

# Build & Run Docker image
```shell
docker build -t amacdexp/hello-node:latest .  

docker run --name hello-node -it --init -p 3001:3000  amacdexp/hello-node:latest  
docker run --name hello-node -d -p 3001:3000  amacdexp/hello-node:latest  
```

## Local Docker Test
http://localhost:3001

## Other related docker commands
```shell
docker kill  
docker stop hello  
docker rm hello  
docker restart hello  
docker images  
docker ps  
```



# Push to Dockerhub
```shell
docker tag amacdexp/hello-node:latest <new id>/hello-node:latest
docker rmi amacdexp/hello-node:latest

docker login docker.io


docker login -u <userid>
docker push amacdexp/hello-node:latest
docker push <new id>/hello-node:latest
```


# Push to SCP CF
```shell
cf api https://api.cf.eu10.hana.ondemand.com
cf login 

cf push <App Name> --docker-image <Docker Image Repository:TagName> --docker-username <docker username>
e.g.
cf push hello-node --docker-image amacdexp/hello-node:latest --docker-username amacdexp
```

Runs at: 
https://hello-node.cfapps.eu10.hana.ondemand.com

# Push to K8S / Kyma
## Pre-req create Kyma system, and create a new namespace "hellodemo"
```shell
# windows cmd
Set KUBECONFIG=C:\<path>\kubeconfig.yaml 
# windows powershell
$env:KUBECONFIG="C:\<path>\kubeconfig.yaml" 
# linux
export KUBECONFIG=/<path>/kubeconfig--<kymasystem>.yaml 

kubectl cluster-info 

# Push to K8S
kubectl replace --force -n test -f k8sDeployment.yaml  
```


## Other K8S commands
```shell
kubectl -n hellodemo get pods  
```
