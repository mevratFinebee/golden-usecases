terraform {
  required_providers {
    http = {
      source = "hashicorp/http"
    }
    kubiya = {
      source = "kubiya-terraform/kubiya"
    }
  }
}

provider "kubiya" {
  // API key is set as an environment variable KUBIYA_API_KEY
}

data "http" "health_check_prompt" {
  url = "https://raw.githubusercontent.com/kubiyabot/community-tools/main/kubernetes/prompts/health_check.md"
}

data "http" "resource_check_prompt" {
  url = "https://raw.githubusercontent.com/kubiyabot/community-tools/main/kubernetes/prompts/resource_check.md"
}

data "http" "cleanup_prompt" {
  url = "https://raw.githubusercontent.com/kubiyabot/community-tools/main/kubernetes/prompts/cleanup.md"
}

data "http" "network_check_prompt" {
  url = "https://raw.githubusercontent.com/kubiyabot/community-tools/main/kubernetes/prompts/network_check.md"
}

data "http" "security_check_prompt" {
  url = "https://raw.githubusercontent.com/kubiyabot/community-tools/main/kubernetes/prompts/security_check.md"
}

data "http" "backup_check_prompt" {
  url = "https://raw.githubusercontent.com/kubiyabot/community-tools/main/kubernetes/prompts/backup_check.md"
}

data "http" "cost_analysis_prompt" {
  url = "https://raw.githubusercontent.com/kubiyabot/community-tools/main/kubernetes/prompts/cost_analysis.md"
}

data "http" "compliance_check_prompt" {
  url = "https://raw.githubusercontent.com/kubiyabot/community-tools/main/kubernetes/prompts/compliance_check.md"
}

data "http" "update_check_prompt" {
  url = "https://raw.githubusercontent.com/kubiyabot/community-tools/main/kubernetes/prompts/update_check.md"
}

data "http" "capacity_check_prompt" {
  url = "https://raw.githubusercontent.com/kubiyabot/community-tools/main/kubernetes/prompts/capacity_check.md"
}

data "http" "kubernetes_ops_prompt" {
  url = "https://raw.githubusercontent.com/kubiyabot/community-tools/main/kubernetes/knowledge/kubernetes_ops.md"
}

resource "kubiya_source" "source" {
  url = "https://github.com/kubiyabot/community-tools/tree/main/kubernetes"
}

resource "kubiya_agent" "kubernetes_crew" {
  name         = var.teammate_name
  runner       = var.kubiya_runner
  description  = var.teammate_description
  instructions = ""
  model        = "azure/gpt-4"
  integrations = ["kubernetes", "slack"]
  users        = var.users
  groups       = var.groups
  sources      = [kubiya_source.source.name]

  environment_variables = {
    LOG_LEVEL            = var.log_level
    NOTIFICATION_CHANNEL = var.notification_slack_channel
  }
}

resource "kubiya_knowledge" "kubernetes_ops" {
  name             = "Kubernetes Operations Guide"
  groups           = var.groups
  description      = "Knowledge base for Kubernetes operations and troubleshooting"
  labels           = ["kubernetes", "operations"]
  supported_agents = [kubiya_agent.kubernetes_crew.name]
  content          = http.kubernetes_ops_prompt.response_body
}

# Load prompts from files



# Core Health Check Task
resource "kubiya_scheduled_task" "health_check" {
  count          = var.enable_health_check_task ? 1 : 0
  scheduled_time = var.health_check_start_time
  repeat         = var.health_check_repeat
  channel_id     = var.notification_slack_channel
  agent          = kubiya_agent.kubernetes_crew.name
  description    = var.health_check_prompt != "" ? var.health_check_prompt : data.http.health_check_prompt.response_body
}

# Resource Optimization Task
resource "kubiya_scheduled_task" "resource_check" {
  count          = var.enable_resource_check_task ? 1 : 0
  scheduled_time = var.resource_check_start_time
  repeat         = var.resource_check_repeat
  channel_id     = var.notification_slack_channel
  agent          = kubiya_agent.kubernetes_crew.name
  description    = var.resource_check_prompt != "" ? var.resource_check_prompt : data.http.resource_check_prompt.response_body
}

# Cleanup Task
resource "kubiya_scheduled_task" "cleanup" {
  count          = var.enable_cleanup_task ? 1 : 0
  scheduled_time = var.cleanup_start_time
  repeat         = var.cleanup_repeat
  channel_id     = var.notification_slack_channel
  agent          = kubiya_agent.kubernetes_crew.name
  description    = var.cleanup_prompt != "" ? var.cleanup_prompt : data.http.cleanup_prompt.response_body
}

# Network Check Task
resource "kubiya_scheduled_task" "network_check" {
  count          = var.enable_network_check_task ? 1 : 0
  scheduled_time = var.network_check_start_time
  repeat         = var.network_check_repeat
  channel_id     = var.notification_slack_channel
  agent          = kubiya_agent.kubernetes_crew.name
  description    = var.network_check_prompt != "" ? var.network_check_prompt : data.http.network_check_prompt.response_body
}

# Security Check Task
resource "kubiya_scheduled_task" "security_check" {
  count          = var.enable_security_check_task ? 1 : 0
  scheduled_time = var.security_check_start_time
  repeat         = var.security_check_repeat
  channel_id     = var.notification_slack_channel
  agent          = kubiya_agent.kubernetes_crew.name
  description    = var.security_check_prompt != "" ? var.security_check_prompt : data.http.security_check_prompt.response_body
}

# Backup Verification Task
resource "kubiya_scheduled_task" "backup_check" {
  count          = var.enable_backup_check_task ? 1 : 0
  scheduled_time = var.backup_check_start_time
  repeat         = var.backup_check_repeat
  channel_id     = var.notification_slack_channel
  agent          = kubiya_agent.kubernetes_crew.name
  description    = var.backup_check_prompt != "" ? var.backup_check_prompt : data.http.backup_check_prompt.response_body
}

# Cost Analysis Task
resource "kubiya_scheduled_task" "cost_analysis" {
  count          = var.enable_cost_analysis_task ? 1 : 0
  scheduled_time = var.cost_analysis_start_time
  repeat         = var.cost_analysis_repeat
  channel_id     = var.notification_slack_channel
  agent          = kubiya_agent.kubernetes_crew.name
  description    = var.cost_analysis_prompt != "" ? var.cost_analysis_prompt : data.http.cost_analysis_prompt.response_body
}

# Compliance Check Task
resource "kubiya_scheduled_task" "compliance_check" {
  count          = var.enable_compliance_check_task ? 1 : 0
  scheduled_time = var.compliance_check_start_time
  repeat         = var.compliance_check_repeat
  channel_id     = var.notification_slack_channel
  agent          = kubiya_agent.kubernetes_crew.name
  description    = var.compliance_check_prompt != "" ? var.compliance_check_prompt : data.http.compliance_check_prompt.response_body
}

# Update Check Task
resource "kubiya_scheduled_task" "update_check" {
  count          = var.enable_update_check_task ? 1 : 0
  scheduled_time = var.update_check_start_time
  repeat         = var.update_check_repeat
  channel_id     = var.notification_slack_channel
  agent          = kubiya_agent.kubernetes_crew.name
  description    = var.update_check_prompt != "" ? var.update_check_prompt : data.http.update_check_prompt.response_body
}

# Capacity Planning Task
resource "kubiya_scheduled_task" "capacity_check" {
  count          = var.enable_capacity_check_task ? 1 : 0
  scheduled_time = var.capacity_check_start_time
  repeat         = var.capacity_check_repeat
  channel_id     = var.notification_slack_channel
  agent          = kubiya_agent.kubernetes_crew.name
  description    = var.capacity_check_prompt != "" ? var.capacity_check_prompt : data.http.capacity_check_prompt.response_body
}

output "kubernetes_crew" {
  value = kubiya_agent.kubernetes_crew
}
