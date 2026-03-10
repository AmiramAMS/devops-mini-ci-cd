# DevOps Mini CI/CD Project – Docker & Nginx

This project was created as part of a DevOps course lab and demonstrates a simple CI/CD workflow using Docker.

The goal of this project is to build a custom Nginx Docker image, upload it to DockerHub, and deploy multiple containers automatically using a Bash menu script.

---

## Project Overview

The project includes two main stages:

### Continuous Integration (CI)

- Create a custom Docker image based on nginx
- Modify the default index.html page
- Build the Docker image
- Test the container locally
- Push the image to DockerHub

### Continuous Delivery (CD)

- Pull the image from DockerHub
- Deploy containers using a menu script
- Stop or remove containers
- Access the running containers from a browser

---

## Docker Image

The image is based on the official nginx image and includes a custom HTML page.

Build the image:

docker build -t amiram6/net4u_nginx .

Push the image to DockerHub:

docker push amiram6/net4u_nginx

---

## Deploy Containers

Containers are deployed using the menu script.

Run the script:

chmod +x menu.sh  
./menu.sh

Example deployment of multiple containers:

docker run -d -p 8081:80 amiram6/net4u_nginx  
docker run -d -p 8082:80 amiram6/net4u_nginx  
docker run -d -p 8083:80 amiram6/net4u_nginx

---

## Service Test

After deploying the containers, the service can be tested using:

curl localhost:8081  
curl localhost:8082  
curl localhost:8083  

Or from a browser:

http://SERVER_IP:8081  
http://SERVER_IP:8082  
http://SERVER_IP:8083  

---

## Project Structure

devops-mini-ci-cd/

Dockerfile  
index.html  
menu.sh  
README.md  

---

## Technologies Used

Docker  
Nginx  
Bash scripting  
DockerHub  
Git & GitHub  

---

## Author

Amiram Amsalem  
DevOps Course – Mini CI/CD Lab
