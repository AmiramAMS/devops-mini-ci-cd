# Mini CI/CD Project – Docker & Nginx

This project is part of a DevOps course lab and demonstrates a simple **CI/CD workflow** using Docker.

The goal is to build a custom **Nginx Docker image**, upload it to **DockerHub**, and deploy containers automatically using a **menu script**.

---

# Project Workflow

CI – Build and publish the Docker image  
CD – Pull the image and deploy containers

Dockerfile
↓
docker build
↓
docker push (DockerHub)
↓
menu.sh
↓
docker pull
↓
deploy containers

Continuous Integration (CI)
1. Create a Dockerfile

The Dockerfile is based on the official nginx image.

FROM nginx:latest

RUN rm /usr/share/nginx/html/index.html
COPY index.html /usr/share/nginx/html/index.html
2. Create a custom web page

index.html

<html>
<head>
<title>DevOps Lab</title>
</head>

<body>
<h1>Hello from my custom Nginx Docker Image</h1>
<p>Mini CI/CD Project</p>
</body>

</html>

3. Build the Docker Image
docker build -t amiram6/net4u_nginx .

4. Run container and test HTTP
docker run -d -p 8080:80 amiram6/net4u_nginx

Check service:

curl localhost:8080

5. Push image to DockerHub
docker login
docker push amiram6/net4u_nginx
Continuous Delivery (CD)

The deployment is controlled using a menu script.

The script allows:

Pull image from DockerHub

Deploy containers

Stop containers

Remove containers/images

Run the script:

chmod +x menu.sh
./menu.sh
Deploy Containers

Example deployment creates multiple containers from the same image:

docker run -d -p 8081:80 amiram6/net4u_nginx
docker run -d -p 8082:80 amiram6/net4u_nginx
docker run -d -p 8083:80 amiram6/net4u_nginx
Testing the Service

Using curl:

curl localhost:8081
curl localhost:8082
curl localhost:8083

Or open in browser:

http://SERVER_IP:8081
http://SERVER_IP:8082
http://SERVER_IP:8083
Project Structure
middle-lab-devops/
│
├── Dockerfile
├── index.html
├── menu.sh
└── README.md
Technologies Used

Docker

Nginx

Bash scripting

DockerHub

GitHub
