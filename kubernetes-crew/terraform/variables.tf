variable "teammate_name" {
  description = "🤖 Name of the Kubernetes Sidekick teammate"
  type        = string
}

variable "kubiya_runner" {
  description = "🏃 Runner (cluster) to use for the teammate"
  type        = string
}

variable "teammate_description" {
  description = "📝 Description of the Kubernetes Sidekick teammate"
  type        = string
  default     = "Kubernetes operations and maintenance assistant"
}

variable "notification_slack_channel" {
  description = "💬 Slack channel for notifications"
  type        = string
  default     = "#k8s-notifications"
}

variable "users" {
  description = "👥 Users who can interact with the teammate"
  type        = list(string)
}

variable "groups" {
  description = "👥 Groups who can interact with the teammate"
  type        = list(string)
  default     = ["Admin"]
}

variable "log_level" {
  description = "📊 Log level for debugging and monitoring"
  type        = string
  default     = "INFO"
}

// Scheduled Tasks Configuration
variable "enable_health_check_task" {
  description = "🏥 Enable scheduled health check task"
  type        = bool
  default     = true
}

variable "health_check_schedule" {
  description = "⏰ Schedule for health check task (hourly, daily, weekly, monthly)"
  type        = string
  default     = "hourly"
}

variable "health_check_prompt" {
  description = "💡 Custom prompt for health check task"
  type        = string
  default     = <<-EOT
    1. Check all nodes status and resource usage
    2. List any pods in CrashLoopBackOff or Error state
    3. Check for pods with high restart counts
    4. Verify pod resource requests and limits
    5. Generate health report with recommendations
    6. If critical issues found, alert in channel
  EOT
}

variable "enable_resource_check_task" {
  description = "📊 Enable scheduled resource optimization task"
  type        = bool
  default     = true
}

variable "resource_check_schedule" {
  description = "⏰ Schedule for resource check task (hourly, daily, weekly, monthly)"
  type        = string
  default     = "daily"
}

variable "resource_check_prompt" {
  description = "💡 Custom prompt for resource optimization task"
  type        = string
  default     = <<-EOT
    1. Check resource usage across all namespaces
    2. Identify pods with high CPU/memory consumption
    3. List unused or idle resources
    4. Check for oversized resource requests
    5. Analyze pod scaling patterns
    6. Provide optimization recommendations
  EOT
}

variable "enable_cleanup_task" {
  description = "🧹 Enable scheduled cleanup task"
  type        = bool
  default     = true
}

variable "cleanup_schedule" {
  description = "⏰ Schedule for cleanup task (hourly, daily, weekly, monthly)"
  type        = string
  default     = "daily"
}

variable "cleanup_prompt" {
  description = "💡 Custom prompt for cleanup task"
  type        = string
  default     = <<-EOT
    1. Find and list failed pods older than 24 hours
    2. Identify completed jobs older than 48 hours
    3. Check for unused ConfigMaps and Secrets
    4. List orphaned PVCs
    5. Recommend cleanup actions
    6. If authorized, clean up identified resources
  EOT
}

variable "enable_network_check_task" {
  description = "🌐 Enable scheduled network check task"
  type        = bool
  default     = true
}

variable "network_check_schedule" {
  description = "⏰ Schedule for network check task (hourly, daily, weekly, monthly)"
  type        = string
  default     = "daily"
}

variable "network_check_prompt" {
  description = "💡 Custom prompt for network check task"
  type        = string
  default     = <<-EOT
    1. Check service endpoints health
    2. Verify ingress configurations
    3. Test internal DNS resolution
    4. Check NetworkPolicy configurations
    5. Identify exposed services
    6. Report network-related issues
  EOT
}

variable "enable_security_check_task" {
  description = "🔒 Enable scheduled security check task"
  type        = bool
  default     = true
}

variable "security_check_schedule" {
  description = "⏰ Schedule for security check task (hourly, daily, weekly, monthly)"
  type        = string
  default     = "daily"
}

variable "security_check_prompt" {
  description = "💡 Custom prompt for security check task"
  type        = string
  default     = <<-EOT
    1. Check for pods running as root
    2. Identify containers without resource limits
    3. Check for deprecated API usage
    4. Verify RBAC configurations
    5. Check pod security context settings
    6. Generate security report with recommendations
  EOT
}

variable "enable_backup_check_task" {
  description = "💾 Enable scheduled backup verification task"
  type        = bool
  default     = true
}

variable "backup_check_schedule" {
  description = "⏰ Schedule for backup verification task (hourly, daily, weekly, monthly)"
  type        = string
  default     = "daily"
}

variable "backup_check_prompt" {
  description = "💡 Custom prompt for backup verification task"
  type        = string
  default     = ""
}

variable "enable_cost_analysis_task" {
  description = "💰 Enable scheduled cost analysis task"
  type        = bool
  default     = true
}

variable "cost_analysis_schedule" {
  description = "⏰ Schedule for cost analysis task (hourly, daily, weekly, monthly)"
  type        = string
  default     = "weekly"
}

variable "cost_analysis_prompt" {
  description = "💡 Custom prompt for cost analysis task"
  type        = string
  default     = ""
}

variable "enable_compliance_check_task" {
  description = "✅ Enable scheduled compliance check task"
  type        = bool
  default     = true
}

variable "compliance_check_schedule" {
  description = "⏰ Schedule for compliance check task (hourly, daily, weekly, monthly)"
  type        = string
  default     = "daily"
}

variable "compliance_check_prompt" {
  description = "💡 Custom prompt for compliance check task"
  type        = string
  default     = ""
}

variable "enable_update_check_task" {
  description = "🔄 Enable scheduled update check task"
  type        = bool
  default     = true
}

variable "update_check_schedule" {
  description = "⏰ Schedule for update check task (hourly, daily, weekly, monthly)"
  type        = string
  default     = "weekly"
}

variable "update_check_prompt" {
  description = "💡 Custom prompt for update check task"
  type        = string
  default     = ""
}

variable "enable_capacity_check_task" {
  description = "📈 Enable scheduled capacity planning task"
  type        = bool
  default     = true
}

variable "capacity_check_schedule" {
  description = "⏰ Schedule for capacity planning task (hourly, daily, weekly, monthly)"
  type        = string
  default     = "weekly"
}

variable "capacity_check_prompt" {
  description = "💡 Custom prompt for capacity planning task"
  type        = string
  default     = ""
}

variable "enable_app_deployment_task" {
  description = "🚀 Enable application deployment monitoring task"
  type        = bool
  default     = true
}

variable "app_deployment_schedule" {
  description = "⏰ Schedule for application deployment monitoring (hourly, daily, weekly, monthly)"
  type        = string
  default     = "hourly"
}

variable "app_deployment_prompt" {
  description = "💡 Custom prompt for application deployment monitoring"
  type        = string
  default     = ""
}

variable "enable_gitops_pr_task" {
  description = "🔄 Enable GitOps PR creation task"
  type        = bool
  default     = true
}

variable "gitops_pr_schedule" {
  description = "⏰ Schedule for GitOps PR creation (hourly, daily, weekly, monthly)"
  type        = string
  default     = "daily"
}

variable "gitops_pr_prompt" {
  description = "💡 Custom prompt for GitOps PR creation"
  type        = string
  default     = ""
}

variable "enable_app_creation_task" {
  description = "🆕 Enable new application setup task"
  type        = bool
  default     = true
}

variable "app_creation_schedule" {
  description = "⏰ Schedule for new application setup (hourly, daily, weekly, monthly)"
  type        = string
  default     = "daily"
}

variable "app_creation_prompt" {
  description = "💡 Custom prompt for new application setup"
  type        = string
  default     = ""
}

variable "enable_deployment_monitor_task" {
  description = "👀 Enable deployment status monitoring task"
  type        = bool
  default     = true
}

variable "deployment_monitor_schedule" {
  description = "⏰ Schedule for deployment status monitoring (hourly, daily, weekly, monthly)"
  type        = string
  default     = "hourly"
}

variable "deployment_monitor_prompt" {
  description = "💡 Custom prompt for deployment status monitoring"
  type        = string
  default     = ""
}

variable "health_check_start_time" {
  description = "Start date and time for the health check task. Format: YYYY-MM-DDTHH:MM:SS"
  type        = string
}

variable "health_check_repeat" {
  description = "Frequency of the health check task. Allowed values: hourly, daily, weekly, monthly."
  type        = string
  default     = "daily"
}

variable "resource_check_start_time" {
  description = "Start date and time for the resource optimization task."
  type        = string
}

variable "resource_check_repeat" {
  description = "Frequency of the resource optimization task."
  type        = string
  default     = "daily"
}

variable "cleanup_start_time" {
  description = "Start date and time for the cleanup task."
  type        = string
}

variable "cleanup_repeat" {
  description = "Frequency of the cleanup task."
  type        = string
  default     = "weekly"
}

variable "network_check_start_time" {
  description = "Start date and time for the network check task."
  type        = string
}

variable "network_check_repeat" {
  description = "Frequency of the network check task."
  type        = string
  default     = "daily"
}

variable "security_check_start_time" {
  description = "Start date and time for the security check task."
  type        = string
}

variable "security_check_repeat" {
  description = "Frequency of the security check task."
  type        = string
  default     = "weekly"
}

variable "backup_check_start_time" {
  description = "Start date and time for the backup verification task. Format: YYYY-MM-DDTHH:MM:SS"
  type        = string
}

variable "backup_check_repeat" {
  description = "Frequency of the backup verification task. Allowed values: hourly, daily, weekly, monthly."
  type        = string
  default     = "daily"
}

variable "cost_analysis_start_time" {
  description = "Start date and time for the cost analysis task."
  type        = string
}

variable "cost_analysis_repeat" {
  description = "Frequency of the cost analysis task."
  type        = string
  default     = "weekly"
}

variable "compliance_check_start_time" {
  description = "Start date and time for the compliance check task."
  type        = string
}

variable "compliance_check_repeat" {
  description = "Frequency of the compliance check task."
  type        = string
  default     = "monthly"
}

variable "update_check_start_time" {
  description = "Start date and time for the update check task."
  type        = string
}

variable "update_check_repeat" {
  description = "Frequency of the update check task."
  type        = string
  default     = "weekly"
}

variable "capacity_check_start_time" {
  description = "Start date and time for the capacity planning task."
  type        = string
}

variable "capacity_check_repeat" {
  description = "Frequency of the capacity planning task."
  type        = string
  default     = "monthly"
}
