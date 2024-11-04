# Core Configuration
variable "teammate_name" {
  description = "Name of the Kubernetes crew teammate"
  type        = string
}

variable "kubiya_runner" {
  description = "Runner for the teammate"
  type        = string
}

variable "teammate_description" {
  description = "Description of the Kubernetes crew teammate"
  type        = string
  default     = "AI-powered Kubernetes operations assistant"
}

# Access Control
variable "users" {
  description = "List of users who can interact with the teammate"
  type        = list(string)
}

variable "groups" {
  description = "List of groups who can interact with the teammate"
  type        = list(string)
  default     = ["Admin"]
}

# Notifications
variable "notification_slack_channel" {
  description = "Slack channel for notifications"
  type        = string
  default     = "#kubernetes-alerts"
}

variable "log_level" {
  description = "Logging level (DEBUG, INFO, WARN, ERROR)"
  type        = string
  default     = "INFO"
}

# Task Schedule Configuration
variable "task_schedules" {
  description = "Schedule configuration for automated tasks"
  type = object({
    health_check = optional(object({
      start_time = string
      repeat     = optional(string, "hourly")
    }))
    resource_check = optional(object({
      start_time = string
      repeat     = optional(string, "daily")
    }))
    security_check = optional(object({
      start_time = string
      repeat     = optional(string, "daily")
    }))
    backup_check = optional(object({
      start_time = string
      repeat     = optional(string, "daily")
    }))
    cleanup = optional(object({
      start_time = string
      repeat     = optional(string, "weekly")
    }))
    cost_analysis = optional(object({
      start_time = string
      repeat     = optional(string, "weekly")
    }))
    compliance_check = optional(object({
      start_time = string
      repeat     = optional(string, "monthly")
    }))
    capacity_check = optional(object({
      start_time = string
      repeat     = optional(string, "monthly")
    }))
    upgrade_check = optional(object({
      start_time = string
      repeat     = optional(string, "monthly")
    }))
  })
  default = {}
}

# Custom Knowledge
variable "custom_cluster_instructions" {
  description = "Custom instructions about your specific Kubernetes cluster setup and management practices"
  type = object({
    cluster_specifics = optional(string, "")  # Specific details about your cluster setup
    naming_conventions = optional(string, "")  # Your organization's naming conventions
    security_policies = optional(string, "")   # Custom security policies and requirements
    backup_policies = optional(string, "")     # Specific backup and DR procedures
    monitoring_setup = optional(string, "")    # Details about monitoring tools and practices
    deployment_flows = optional(string, "")    # Custom deployment procedures
    contact_info = optional(string, "")        # Emergency contacts and escalation paths
  })
  default = {}
}

# Task Enablement
variable "enabled_tasks" {
  description = "Control which automated tasks are enabled"
  type = object({
    health_check     = optional(bool, true)
    resource_check   = optional(bool, true)
    security_check   = optional(bool, true)
    backup_check     = optional(bool, true)
    cleanup          = optional(bool, true)
    cost_analysis    = optional(bool, true)
    compliance_check = optional(bool, true)
    capacity_check   = optional(bool, true)
    upgrade_check    = optional(bool, true)
  })
  default = {}
}

# Add this to the existing variables.tf
variable "cluster_type" {
  description = "Type of Kubernetes cluster (EKS, GKE, AKS, or custom)"
  type        = string
  default = "EKS"
  validation {
    condition     = contains(["EKS", "GKE", "AKS", "custom"], var.cluster_type)
    error_message = "Cluster type must be one of: EKS, GKE, AKS, or custom"
  }
}
