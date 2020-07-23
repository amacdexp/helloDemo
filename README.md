# Intro
Helloworld deployable on CF & K8S (Kyma)  
https://kyma-project.io/docs/

Similar to:  
Hello World 3 Ways: ABAP, Cloud Foundry, and Kubernetes  
https://www.youtube.com/watch?v=lbJ2I964pfY&t=1317s



# Test Locally
## terminal
cd ../hello  
npm start  

## test
http://localhost:3000  

# Build & Run Docker image
docker build -t am/hello:latest .  

docker run --name hello -it --init -p 3001:3000  am/hello:latest  
docker run --name hello -d -p 3001:3000  am/hello:latest  

## test
http://localhost:3001

## other related docker commands
docker kill  
docker stop hello  
docker rm hello  
docker restart hello  
docker images  
docker ps  



# Push to Dockerhub
docker tag am/hello:latest amacdonaldsap/hello:latest
docker rmi am/hello:latest

docker login docker.io


docker login -u <userid>
docker push amacdonaldsap/hello:latest


# Push to SCP CF
cf api https://api.cf.eu10.hana.ondemand.com
cf login 

cf push <App Name> --docker-image <Docker Image Repository:TagName> --docker-username <docker username>
e.g.
cf push helloDemo --docker-image amacdonaldsap/hello:latest --docker-username amacdonaldsap

Runs at:
hellodemo.cfapps.eu10.hana.ondemand.com

# Push to K8S / Kyma
## Pre-req create Kyma system, and create a new namespace "hellodemo"

## windows cmd
Set KUBECONFIG=C:\<path>\kubeconfig--aaazzzz--okr0hqyaqu.yaml 
## windows powershell
$env:KUBECONFIG="C:\<path>\kubeconfig--aaazzzz--okr0hqyaqu.yaml" 
## linux
export KUBECONFIG=/<path>/kubeconfig--<kymasystem>.yaml 

kubectl cluster-info 
kubectl replace --force -n hellodemo -f k8sDeployment.yaml  


# K8S commands
kubectl -n hellodemo get pods  

