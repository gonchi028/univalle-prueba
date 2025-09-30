# GitHub Actions Docker Demo

[![Build Status](https://img.shields.io/badge/Docker-Ready-blue?style=flat-square&logo=docker)](https://www.docker.com)
[![Nginx](https://img.shields.io/badge/Nginx-Stable-green?style=flat-square&logo=nginx)](https://nginx.org)
[![License](https://img.shields.io/badge/License-MIT-yellow?style=flat-square)](LICENSE)

A simple containerized web application demonstrating Docker deployment with Nginx, perfect for learning GitHub Actions and CI/CD workflows.

[Overview](#overview) • [Quick Start](#quick-start) • [Development](#development) • [Docker](#docker) • [Deployment](#deployment)

## Overview

This project showcases a minimal web application containerized with Docker and served by Nginx. It's designed as a learning resource for understanding containerization, GitHub Actions, and automated deployment workflows.

**Features:**
- 🐳 **Dockerized**: Ready-to-deploy container with Nginx
- 🚀 **Lightweight**: Minimal setup with Alpine Linux base
- 📦 **Simple**: Clean HTML/CSS structure for easy customization
- ⚡ **Fast**: Optimized for quick builds and deployments
- 🔧 **Educational**: Perfect for CI/CD learning

## Quick Start

### Prerequisites

- [Docker](https://www.docker.com/get-started/) installed on your machine
- Basic knowledge of HTML/CSS (optional)

### Run with Docker

1. **Clone the repository:**
   ```bash
   git clone <your-repo-url>
   cd tema-3-actions
   ```

2. **Build the Docker image:**
   ```bash
   docker build -t nginx-demo .
   ```

3. **Run the container:**
   ```bash
   docker run -p 8080:80 nginx-demo
   ```

4. **Open your browser** and navigate to `http://localhost:8080`

You should see the "Hola desde nginx y dockerhub" message displayed with blue styling.

## Development

### Project Structure

```
├── Dockerfile          # Container configuration
├── index.html          # Main HTML page
├── style.css           # CSS styles
└── README.md           # This file
```

### Local Development

To modify the application without Docker:

1. **Edit the files:**
   - `index.html` - Update the HTML content
   - `style.css` - Modify the styling

2. **Test locally:**
   Open `index.html` directly in your browser to preview changes

3. **Rebuild the container:**
   ```bash
   docker build -t nginx-demo .
   docker run -p 8080:80 nginx-demo
   ```

> [!TIP]
> For rapid development, you can mount the files as volumes:
> ```bash
> docker run -p 8080:80 -v $(pwd):/usr/share/nginx/html nginx:stable-alpine
> ```

## Docker

### Container Details

- **Base Image**: `nginx:stable-alpine` - Lightweight and secure
- **Port**: Exposes port 80 (HTTP)
- **Files**: Copies `index.html` and `style.css` to the Nginx document root

### Docker Commands

```bash
# Build the image
docker build -t nginx-demo .

# Run the container
docker run -p 8080:80 nginx-demo

# Run in detached mode
docker run -d -p 8080:80 --name my-nginx nginx-demo

# Stop the container
docker stop my-nginx

# Remove the container
docker rm my-nginx

# View logs
docker logs my-nginx
```

### Docker Hub Deployment

This project is configured for Docker Hub deployment. To push your own version:

```bash
# Tag the image
docker tag nginx-demo your-username/nginx-demo:latest

# Push to Docker Hub
docker push your-username/nginx-demo:latest
```

## Deployment

### GitHub Actions

This project is designed to work with GitHub Actions for automated CI/CD. A typical workflow would:

1. **Build** the Docker image on code changes
2. **Test** the container starts correctly
3. **Push** the image to Docker Hub
4. **Deploy** to your hosting platform

### Manual Deployment

For manual deployment to various platforms:

**Docker Hub:**
```bash
docker build -t your-username/nginx-demo .
docker push your-username/nginx-demo
```

**Azure Container Instances:**
```bash
az container create \
  --resource-group myResourceGroup \
  --name nginx-demo \
  --image your-username/nginx-demo \
  --dns-name-label nginx-demo-unique
```

**AWS ECS or other container platforms:**
Follow your platform's container deployment documentation.

## Customization

### Updating Content

1. **Modify `index.html`** to change the page content:
   ```html
   <h1>Your custom message here</h1>
   ```

2. **Update `style.css`** to change the appearance:
   ```css
   h1 {
     color: #your-color;
     font-size: 2rem;
   }
   ```

3. **Rebuild and test:**
   ```bash
   docker build -t nginx-demo .
   docker run -p 8080:80 nginx-demo
   ```

### Advanced Configuration

For more advanced Nginx configuration, you can:

1. **Create a custom `nginx.conf`**
2. **Add it to the Dockerfile:**
   ```dockerfile
   COPY nginx.conf /etc/nginx/nginx.conf
   ```
3. **Rebuild the container**

## Troubleshooting

**Container won't start:**
- Check if port 8080 is already in use: `lsof -i :8080`
- Try a different port: `docker run -p 9090:80 nginx-demo`

**Changes not reflecting:**
- Ensure you rebuilt the Docker image after making changes
- Clear browser cache or use incognito mode

**Docker build fails:**
- Verify Docker is running: `docker version`
- Check file permissions and paths

## Resources

- [Docker Documentation](https://docs.docker.com/)
- [Nginx Documentation](https://nginx.org/en/docs/)
- [GitHub Actions Documentation](https://docs.github.com/en/actions)
- [Docker Hub](https://hub.docker.com/)

---

> **Note**: This is an educational project for learning containerization and CI/CD concepts. Feel free to fork and modify it for your own learning purposes!
