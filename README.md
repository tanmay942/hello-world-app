# Hello World – Containerized Node.js App

A simple "Hello World" web application containerized with Docker and deployed via a GitHub Actions CI/CD pipeline.

---

## Project Structure

```
hello-world-app/
├── app.js                          # Node.js HTTP server
├── package.json                    # Node dependencies
├── Dockerfile                      # Container build instructions
├── .dockerignore                   # Files excluded from Docker build
└── .github/
    └── workflows/
        └── docker-build.yml        # GitHub Actions CI/CD pipeline
```

---

## Running Locally

### Without Docker
```bash
node app.js
# Visit http://localhost:3000
```

### With Docker
```bash
# Build the image
docker build -t hello-world-app .

# Run the container
docker run -p 3000:3000 hello-world-app

# Visit http://localhost:3000
```

---

## GitHub Actions Setup

The workflow triggers automatically on every push to `main` and:
1. Checks out the code
2. Logs in to Docker Hub
3. Builds the Docker image
4. Pushes it to Docker Hub with two tags: `latest` and the commit SHA

### Required Secrets

Add these secrets to your GitHub repository under **Settings → Secrets → Actions**:

| Secret Name          | Description                          |
|----------------------|--------------------------------------|
| `DOCKERHUB_USERNAME` | Your Docker Hub username             |
| `DOCKERHUB_TOKEN`    | Your Docker Hub access token (not password) |

To create a Docker Hub access token: go to **Docker Hub → Account Settings → Security → New Access Token**.

---

## Docker Hub Image

Once the pipeline runs, your image will be available at:
```
docker pull <your-username>/hello-world-app:latest
```
