# 🚀 DevOps Build Project

## 📌 Overview

This project demonstrates a complete **end-to-end DevOps CI/CD pipeline** for deploying a React-based application in a production-ready environment.

The application is containerized using Docker, deployed on AWS EC2, automated with Jenkins Multibranch Pipeline, and monitored using Uptime Kuma with real-time Telegram alerts.

---

## 🛠️ Tech Stack

* **Frontend**: React (static build)
* **Containerization**: Docker, Nginx
* **CI/CD**: Jenkins (Multibranch Pipeline)
* **Cloud**: AWS EC2
* **Registry**: Docker Hub
* **Monitoring**: Uptime Kuma
* **Notifications**: Telegram Bot

---

## ⚙️ Architecture

```text
GitHub → Jenkins (CI/CD) → Docker Hub → AWS EC2 → Application → Monitoring → Alerts
```

---

## 🔄 CI/CD Workflow

### 🔹 Development Flow (dev branch)

1. Code pushed to `dev` branch
2. Jenkins automatically triggers build via webhook
3. Docker image is built
4. Image is pushed to Docker Hub (`dev` repository)

### 🔹 Production Flow (master branch)

1. Code merged/pushed to `master`
2. Jenkins triggers pipeline
3. Production Docker image is built
4. Image is pushed to Docker Hub (`prod` repository - private)

---

## 🐳 Docker Setup

### Dockerfile

* Uses `nginx:alpine`
* Serves React static files
* Configured with custom `nginx.conf`

### Run Application

```bash
docker run -d -p 80:80 deepanlm10/dev:latest
```

---

## ☁️ AWS Deployment

* Instance Type: `t3.micro`
* OS: Ubuntu 22.04
* Application exposed on:

```text
http://13.235.8.39
```

### Security Group Rules

| Port | Purpose                   |
| ---- | ------------------------- |
| 80   | Application Access        |
| 22   | SSH (restricted to my IP) |
| 8080 | Jenkins                   |
| 3001 | Monitoring (Uptime Kuma)  |

---

## 📊 Monitoring & Alerts

### Uptime Kuma

* Health endpoint: `/health`
* Checks every 60 seconds
* Tracks uptime and response time

### Telegram Alerts

* Sends notification when:

  * Application goes **DOWN ❌**
  * Application comes **UP ✅**

---

## 📸 Screenshots

* Jenkins Pipeline (dev & master)
* Docker Hub repositories
* AWS EC2 instance & security group
* Application running in browser
* Uptime Kuma dashboard (UP/DOWN)
* Telegram alert notifications

---

## 📦 Docker Hub Repositories

* Dev: `deepanlm10/dev`
* Prod: `deepanlm10/prod` (private)

---

## 📁 Project Structure

```
devops-build/
├── build/
├── monitoring/
│   └── docker-compose.monitoring.yml
├── Dockerfile
├── nginx.conf
├── docker-compose.yml
├── build.sh
├── deploy.sh
├── Jenkinsfile
├── .dockerignore
├── .gitignore
```

---

## 🎯 Key Features

* Automated CI/CD using Jenkins Multibranch Pipeline
* Branch-based deployment strategy (dev & prod)
* Dockerized application deployment
* Cloud deployment on AWS EC2
* Real-time health monitoring
* Alerting system using Telegram

---

## 🧠 Learnings

* End-to-end CI/CD pipeline implementation
* Docker image build & deployment workflow
* Jenkins automation with GitHub webhook
* Infrastructure setup on AWS EC2
* Monitoring and alerting strategies

---

## ⭐ Conclusion

This project showcases a **production-level DevOps workflow**, covering:

* Continuous Integration
* Continuous Deployment
* Monitoring & Alerting

It reflects real-world DevOps practices used in modern cloud environments.
