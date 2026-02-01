# 🚀 Flask App Deployment on Kubernetes (Minikube)

This project demonstrates how to containerize a simple Flask application, push the image to Docker Hub, and deploy it on Kubernetes using **Deployment**, **Service**, and **Ingress** inside a **Minikube cluster**.

<img width="1919" height="929" alt="Screenshot from 2026-02-01 17-34-34" src="https://github.com/user-attachments/assets/b5a026ec-9f40-483c-8851-2dfed0a92476" />
<img width="1919" height="929" alt="Screenshot from 2026-02-01 17-37-40" src="https://github.com/user-attachments/assets/acdd064c-873c-4b9c-a044-e92fc6427e87" />



---

## 📌 Features

✅ Flask application running inside Kubernetes  
✅ Docker image built and pushed to Docker Hub  
✅ Kubernetes Deployment with multiple replicas  
✅ Service exposure using ClusterIP / NodePort  
✅ Ingress configured with a custom domain (`flask.local`)  
✅ Works fully on Minikube for learning and practice  

---

## 🛠 Tech Stack

- Python (Flask)
- Docker
- Kubernetes
- Minikube
- NGINX Ingress Controller

---

## 📂 Project Structure

```

flask-app/
│── app.py
│── Dockerfile
│── deployment.yaml
│── service.yaml
│── ingress.yaml
│── README.md

````

---

## 🚀 Step-by-Step Deployment Guide

---

# 1️⃣ Start Minikube Cluster

```bash
minikube start
````

---

# 2️⃣ Build and Push Docker Image

Build the Flask image:

```bash
docker build -t abdueissa/flask-k8s:v1 .
```

Push it to Docker Hub:

```bash
docker push abdueissa/flask-k8s:v1
```

---

# 3️⃣ Deploy the Application on Kubernetes

Apply the Deployment:

```bash
kubectl apply -f deployment.yaml
```

Verify pods are running:

```bash
kubectl get pods
```

---

# 4️⃣ Expose the App with a Service

Apply the Service:

```bash
kubectl apply -f service.yaml
```

Check the service:

```bash
kubectl get svc
```

---

# 5️⃣ Enable Ingress in Minikube

Enable the ingress addon:

```bash
minikube addons enable ingress
```

Verify controller is running:

```bash
kubectl get pods -n ingress-nginx
```

---

# 6️⃣ Create and Apply Ingress Resource

Apply ingress:

```bash
kubectl apply -f ingress.yaml
```

Check ingress status:

```bash
kubectl get ingress
```

---

# 7️⃣ Configure Domain Name (`flask.local`)

Get Minikube IP:

```bash
minikube ip
```

Edit `/etc/hosts`:

```bash
sudo nano /etc/hosts
```

Add:

```txt
<MINIKUBE-IP> flask.local
```

Example:

```txt
192.168.49.2 flask.local
```

---

# 8️⃣ Start Minikube Tunnel

Ingress routing requires:

```bash
sudo minikube tunnel
```

Keep this running in a separate terminal.

---

# 9️⃣ Access the Application

Open your browser:

```
http://flask.local
```

You should see:

```
Hello from Flask 🚀
```

---

## ✅ Useful Commands

Delete deployment:

```bash
kubectl delete deployment flask
```

Delete service:

```bash
kubectl delete svc flask
```

Delete ingress:

```bash
kubectl delete ingress flask-ingress
```

Restart deployment:

```bash
kubectl rollout restart deployment flask
```

---

## 📌 Next Improvements

* Add ConfigMaps & Secrets
* Add HTTPS using cert-manager
* Deploy to AWS EKS
* Use Helm charts for packaging

---

## 👨‍💻 Author

**Abdullrahman Eissa**
DevOps & Linux Administrator (LFCS)

---

⭐ If you found this project helpful, feel free to star the repo!
