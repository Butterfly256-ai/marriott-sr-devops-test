Documentation as Code

## 1. Application Design & Diagram

### 1.1 Application Introduction
This project is a web application consisting of two core service modules:
- **Frontend**: User-facing web service, responsible for UI rendering, user interaction and request forwarding.
- **Backend**: Backend API service, responsible for business logic processing, data computation and external service invocation.

Both services are containerized and deployed on Kubernetes, with independent scaling policies to ensure service elasticity.

### 1.2 Key Components Description
- **Ingress**: Unified traffic entry, route requests to corresponding frontend/backend services.
- **Frontend Service**: Stateless web frontend, multiple Pod replicas for high availability.
- **Backend Service**: Stateless API backend, provides core business capabilities.
- **HPA (Horizontal Pod Autoscaler)**: Automatically adjust Pod replicas based on CPU/memory usage to handle traffic fluctuations.

## 2. Infrastructure Design & Diagram

### 2.1 Infrastructure Overview
The whole infrastructure is built on AWS EKS (Elastic Kubernetes Service). All resources are managed via IaC (Infrastructure as Code) and Kustomize, achieving environment consistency and repeatable deployment.

### 2.2 Infrastructure Components
- **AWS EKS**: Managed Kubernetes cluster, runs all application workloads.
- **EC2 Node Group**: Compute nodes of EKS, host all application Pods.
- **Amazon ECR**: Private container registry, stores built Frontend/Backend Docker images.
- **IAM**: AWS identity & access management, control permissions for ECR image pull/push and EKS cluster access.
- **Harness Delegate**: Execution agent deployed inside the environment, responsible for pipeline running, cluster operation and image management.
- **Kubernetes Resources**: Service, Ingress, Deployment, HPA, ConfigMap, Secret for application runtime.


## 3 CI/CD Pipeline Design 
### 3.1 Pipeline Workflow Overview
The end-to-end CI/CD pipeline is implemented based on Harness CI/CD, covering code pull → image build & push → Kubernetes deployment. All deployment manifests are managed by Kustomize.

### 3.2 Pipeline Stage & Step Details
#### Stage 1: CI - Build_Backend_Frontend
- **Checkout Code**: Pull latest source code from GitHub repository.
- **Build & Push Backend**: Build backend Docker image, tag with pipeline sequence ID + latest, push to AWS ECR.
- **Build & Push Frontend**: Build frontend Docker image, tag with pipeline sequence ID + latest, push to AWS ECR.

#### Stage 2: CD - Deploy_To_EKS
- **Load Kustomize Manifests**: Parse and render Kubernetes manifests via Kustomize.
- **K8s Apply**: Deploy all resources (Deployment, Service, Ingress, HPA, ConfigMap, Secret) to EKS cluster.
- **Steady State Check**: Verify all Pods and workloads are running normally.
