Documentation as Code

## 1. Application Design & Diagram

### 1.1 Application Introduction
This project is a web application consisting of two core service modules:
- **Frontend**: User-facing web service, responsible for UI rendering, user interaction and request forwarding.
- **Backend**: Backend API service, responsible for business logic processing, data computation and external service invocation.

Both services are containerized and deployed on Kubernetes, with independent scaling policies to ensure service elasticity.

### 1.2 Architecture Diagram
```mermaid
flowchart LR
    User[End User] -->|HTTP/HTTPS| Ingress[K8s Ingress]
    Ingress --> FrontendSvc[Frontend Service]
    Ingress --> BackendSvc[Backend Service]

    subgraph Kubernetes Workloads
        FrontendSvc --> PodF1[Frontend Pod 1]
        FrontendSvc --> PodF2[Frontend Pod 2]
        BackendSvc --> PodB1[Backend Pod 1]
        BackendSvc --> PodB2[Backend Pod 2]
    end

    FrontendSvc -.->|API Request| BackendSvc

    subgraph Resilience
        HPA_F[HPA - Frontend] -.-> AutoScaleF[Auto Scale Pods]
        HPA_B[HPA - Backend] -.-> AutoScaleB[Auto Scale Pods]
    end

### 1.3 Key Components Description
- **Ingress**: Unified traffic entry, route requests to corresponding frontend/backend services.
- **Frontend Service**: Stateless web frontend, multiple Pod replicas for high availability.
- **Backend Service**: Stateless API backend, provides core business capabilities.
- **HPA (Horizontal Pod Autoscaler)**: Automatically adjust Pod replicas based on CPU/memory usage to handle traffic fluctuations.
- **ConfigMap & Secret**: Store application configuration, environment variables and sensitive credentials separately.
