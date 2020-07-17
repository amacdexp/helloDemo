## Docker file used co create image with Nodejs and Application code

#Default image with Nodejs
from node:8.16.0

#create workdirectory for app
WORKDIR /usr/src/app

ARG app_node_module_folder="/hello"

#install app dependencies first
#copy both local package.json and package-lock.json  to container workdirectory
#copy .npmrc    containing sap npm registry
#where avaialble use (npm@5+)
COPY ${app_node_module_folder}/package*.json ./
COPY ${app_node_module_folder}/.npmrc .npmrc

RUN npm install


#Copy Node Application 
COPY ${app_node_module_folder}/. .


#EXPOSE PORT e.g. 3000
EXPOSE 3000

## Run App
CMD ["node" , "server.js"]
