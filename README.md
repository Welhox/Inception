
# 🏗️ Inception - Dockerized WordPress Setup  

## 📌 Introduction  

This project provides a **Dockerized WordPress environment** consisting of three interconnected containers:  

- **NGINX**: Reverse proxy and HTTPS handler.  
- **MariaDB**: Database backend for WordPress.  
- **WordPress**: Runs the WordPress CMS.  

NGINX is the only entry point, enforcing **HTTPS on port 443** (HTTP requests are redirected).  

---

## 📜 Table of Contents  

- [Installation](#installation)  
- [Usage](#usage)  
- [Configuration](#configuration)  
- [Project Structure](#project-structure)  
- [Containers Overview](#containers-overview)  
- [Troubleshooting](#troubleshooting)  
- [Contributors](#contributors)  
- [License](#license)  

---

## ⚙️ Installation  

### 🛠 Prerequisites  

Ensure the following dependencies are installed:  

- [Docker](https://docs.docker.com/get-docker/)  
- [Docker Compose](https://docs.docker.com/compose/install/)  
- [`mkcert`](https://github.com/FiloSottile/mkcert)  

### 🏗 Setup Steps  

1. **Edit the environment configuration:**  
   ```bash
   vim make_env.sh
   ```  
   Fill in the necessary details.  

2. **Generate environment variables:**  
   ```bash
   make env
   ```  

3. **Set up SSL certificates:**  
   ```bash
   make ssl
   ```  

4. **Build and run the project:**  
   ```bash
   make
   ```  

---

## 🚀 Usage  

Once running, access WordPress at:  

- **HTTPS:** `https://login.42.fr`  
- **HTTP is automatically redirected to HTTPS**.  

---

## 🛠 Configuration  

Modify your **hosts file**:  

```bash
sudo vim /etc/hosts
```  

Add the following:  

```
127.0.0.1 login.42.fr localhost
127.0.1.1 login.42.fr
```  

This ensures correct local domain resolution.  

---

## 📁 Project Structure  

```
📦 inception
└── 📂 srcs
    ├── 📜 commands.txt
    ├── 📜 docker-compose.yml
    ├── 📜 .env
    └── 📂 requirements
        ├── 📂 mariadb
        │   ├── 📜 Dockerfile
        │   ├── 📂 conf
        │   │   ├── mariadb-server.cnf
        │   └── 📂 tools
        │       ├── entrypoint.sh
        │       ├── make_dirs.sh
        ├── 📂 nginx
        │   ├── 📜 Dockerfile
        │   ├── 📂 conf
        │   │   ├── nginx.conf
        │   │   ├── fastcgi_params
        │   └── 📂 tools
        │       ├── login.42.fr.crt
        │       ├── login.42.fr.key
        ├── 📂 wordpress
            ├── 📜 Dockerfile
            ├── 📂 conf
            │   ├── www.conf
            └── 📂 tools
                ├── entrypoint.sh
```  

---

## 🔗 Containers Overview  

| Container  | Purpose                                   | Exposed Ports |  
|------------|-------------------------------------------|--------------|  
| **NGINX**  | Reverse proxy & HTTPS handler            | 443 (HTTPS) |  
| **MariaDB**| Database backend for WordPress           | Internal only |  
| **WordPress** | Runs WordPress CMS                     | Internal only |  

---

## ❗ Troubleshooting  

### 🔄 Restarting the Environment  

To restart all containers:  
```bash
make down
make
```  

### 📜 Checking Logs  

For debugging, check logs for specific services:  

```bash
docker logs nginx
docker logs wordpress
docker logs mariadb
```  

---

## 👥 Contributors  

- **Welhox**

---

## 📄 License  

This project is licensed under the **MIT License**.  

---
