# 🚀 Kubernetes Crew

Kubernetes Crew is your intelligent companion within the Kubiya platform, designed to simplify and enhance Kubernetes cluster management. It provides a suite of powerful tools to interact with Kubernetes clusters, handling end-to-end processes for monitoring, kubectl access, Helm chart management, and much more.

![image](https://github.com/user-attachments/assets/18503bac-9adf-43ea-96a1-ac0e9ca614f1)

**🎓 Become a Kubernetes expert in no time! With Kubernetes Crew, everyone on your team can master Kubernetes effortlessly, managing clusters like a pro.**

## 🌟 Features

- 🩺 **Cluster health monitoring**
- 🕵️ **Intelligent event scraping**
- 🎛️ **kubectl access**
- ⛵ **Helm chart application (optional)**
- 🚢 **Argo CD integration (optional)**
- 🔐 **Custom kubeconfig support**
- 🏠 **In-cluster context support**
- 💬 **Slack notifications**

## 🔄 User Flows

### 1. 🩺 Cluster Health Monitoring

Kubernetes Crew continuously monitors cluster health, scraping events, analyzing node and pod statuses, and sending alerts. This ensures timely detection of issues and automatic remediation processes.

```mermaid
graph TD
    A[🏁 Start Monitoring] --> B{🤔 Is Cluster Healthy?}
    B --> |Yes| C[✅ Continue Monitoring]
    B --> |No| D[🚨 Send Alert to Slack]
    D --> E[🔧 Initiate Remediation]
    E --> F{🤞 Remediation Success?}
    F --> |Yes| C
    F --> |No| G[👨‍💼 Escalate Issue]
    
    style A fill:#f9d71c,stroke:#333,stroke-width:2px
    style B fill:#f9a61c,stroke:#333,stroke-width:2px
    style C fill:#66c256,stroke:#333,stroke-width:2px
    style D fill:#e74c3c,stroke:#333,stroke-width:2px
    style E fill:#3498db,stroke:#333,stroke-width:2px
    style F fill:#f9a61c,stroke:#333,stroke-width:2px
    style G fill:#e74c3c,stroke:#333,stroke-width:2px
```

### 2. 🎛️ kubectl Access

Kubernetes Crew grants users direct access to kubectl commands without needing extensive Kubernetes knowledge. Manage deployments, services, and more right from Slack!

```mermaid
sequenceDiagram
    participant U as User
    participant S as Slack
    participant KS as Kubernetes Crew
    participant K as Kubernetes Cluster

    U->>S: Request kubectl command
    S->>KS: Forward request
    KS->>KS: Validate user access
    alt Has Access
        KS->>K: Execute kubectl command
        K->>KS: Return result
        KS->>S: Send result
        S->>U: Display result
    else No Access
        KS->>S: Request access notification
        S->>U: Notify access needed
        U->>S: Grant access
        S->>KS: Access granted
        KS->>K: Execute kubectl command
        K->>KS: Return result
        KS->>S: Send result
        S->>U: Display result
    end

    style U fill:#f9d71c,stroke:#333,stroke-width:2px
    style S fill:#e67e22,stroke:#333,stroke-width:2px
    style KS fill:#3498db,stroke:#333,stroke-width:2px
    style K fill:#2ecc71,stroke:#333,stroke-width:2px
```

### 3. 🚀 Deployment Workflow

Here's an example of how Kubernetes Crew can streamline your deployment process:

```mermaid
graph TD
    A[👩‍💻 Developer pushes code] --> B[🏗️ CI/CD pipeline triggered]
    B --> C[📦 Build Docker image]
    C --> D[🔄 Update Helm chart]
    D --> E{🤖 Kubernetes Crew}
    E --> F[🔍 Validate Helm chart]
    F --> G[⛵ Deploy with Helm]
    G --> H[🩺 Monitor deployment health]
    H --> I{😊 Deployment successful?}
    I -->|Yes| J[✅ Notify team in Slack]
    I -->|No| K[🚨 Alert team and rollback]
    
    style A fill:#f9d71c,stroke:#333,stroke-width:2px
    style B fill:#3498db,stroke:#333,stroke-width:2px
    style C fill:#e67e22,stroke:#333,stroke-width:2px
    style D fill:#9b59b6,stroke:#333,stroke-width:2px
    style E fill:#2ecc71,stroke:#333,stroke-width:2px
    style F fill:#f1c40f,stroke:#333,stroke-width:2px
    style G fill:#1abc9c,stroke:#333,stroke-width:2px
    style H fill:#34495e,stroke:#333,stroke-width:2px
    style I fill:#e74c3c,stroke:#333,stroke-width:2px
    style J fill:#27ae60,stroke:#333,stroke-width:2px
    style K fill:#c0392b,stroke:#333,stroke-width:2px
```

## 🛠️ Configuration

Below are the key variables used to configure the Kubernetes Crew agent:

| Variable Name | Description | Type | Default |
|---------------|-------------|------|---------|
| `teammate_name` | Name of the Kubernetes Crew teammate | `string` | |
| `kubiya_runner` | Runner (cluster) to use for the teammate | `string` | |
| `teammate_name` | Description of the Kubernetes Crew teammate | `string` | |
| `use_custom_kubeconfig` | Whether to use a custom kubeconfig | `bool` | `false` |
| `custom_kubeconfig` | Custom kubeconfig as a string | `string` | `""` |
| `use_in_cluster_context` | Whether to use in-cluster context | `bool` | `true` |
| `enable_cluster_health_monitoring` | Enable cluster health monitoring | `bool` | `true` |
| `cluster_health_check_interval` | Interval for cluster health checks | `string` | `"1h"` |
| `enable_intelligent_event_scraping` | Enable intelligent event scraping | `bool` | `true` |
| `enable_kubectl_access` | Enable kubectl access | `bool` | `true` |
| `enable_helm_chart_application` | Enable applying Helm charts | `bool` | `false` |
| `enable_argo_cd_integration` | Enable Argo CD integration | `bool` | `false` |
| `notification_slack_channel` | Slack channel for notifications | `string` | `""` |
| `users` | Users who can interact with the teammate | `list(string)` | |
| `groups` | Groups who can interact with the teammate | `list(string)` | |
| `integrations` | Integrations for the teammate | `list(string)` | |
| `log_level` | Log level | `string` | `"INFO"` |
| `debug` | Enable debug mode | `bool` | `false` |
| `dry_run` | Enable dry run mode | `bool` | `false` |

## 🚀 Getting Started

1. **Log into Kubiya Platform**:
   - Visit [app.kubiya.ai](https://app.kubiya.ai)
   - Log in with your credentials

2. **Navigate to Use Cases**:
   - Go to "Teammates" section
   - Click on "Use Cases"
   - Click "Add Use Case"
   - Select "Kubernetes Crew"

3. **Configure Settings**:
   Fill in the required fields:
   - Teammate Name (e.g., "k8s-crew")
   - Kubernetes context
   - Slack Channel for notifications
   - Health check interval
   - Monitoring settings
   - Access permissions

4. **Deploy**:
   - Review your configuration
   - Click "Deploy Use Case"
   - Wait for confirmation

## 🎭 Example Scenarios

* You can converse with either natural language requests or parts of kubectl commands , the LLM will get it

### Scenario 1: Troubleshooting a Failing Deployment

1. **Alert**: Kubernetes Crew detects a failing deployment and sends a Slack alert.
2. **Investigation**: Team member asks for more details:
   ```
   @k8s-crew describe deployment failing-app -n production
   ```
3. **Root Cause**: Kubernetes Crew identifies a misconfigured environment variable.
4. **Fix**: Team member updates the deployment:
   ```
   @k8s-crew please set env CRITICAL_VAR=correct-value in deployment/failing-app ns production
   ```
5. **Verification**: Kubernetes Crew confirms the deployment is now healthy.

### Scenario 2: Scaling for Black Friday

1. **Preparation**: Team decides to scale up for increased traffic:
   ```
   @k8s-crew scale deployment ecommerce-frontend --replicas=10 -n production
   ```
2. **Monitoring**: Kubernetes Crew provides real-time updates on cluster resource usage.
3. **Auto-scaling**: Kubernetes Crew suggests and applies HPA settings for dynamic scaling.
4. **Performance**: Team monitors application performance through Kubernetes Crew's integration with monitoring tools.

---

With **Kubernetes Crew**, managing Kubernetes clusters is now easier than ever. Delegate tasks, stay informed, and manage your clusters like a pro! 🎉🚀
