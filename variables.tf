variable "location" {
  type    = string
  default = "eastus"
}
variable "rg-name" {
  type    = string
  default = "azeus-kubaks-rg"
}
variable "clustername" {
  type    = string
  default = "kubaks"
}

variable "end_date_relative_in_hours" {
  type        = string
  description = "Relative end date in hours"
  default     = "867240h" # ninety-nine years
}

variable "common_tags" {
  type        = map
  description = "Common tags to be applied to the Virtual Network resources"
  default = {
    env               = "development"
    Product           = "AKS"
    terraform-managed = true
  }
}

variable "project_tags" {
  type        = map
  description = "Project specific tags to be applied to the Virtual Network resources."
  default = {
    Project = "aks-development"
  }
}

variable "log_analytics_enabled" {
  type        = string
  description = "Configure ContainerInsights (analytics)"
  default     = false
}

variable "log_analytics_workspace_sku" {
  type        = string
  description = "The SKU (pricing level) of the Log Analytics workspace"
  default     = "PerGB2018"
}

variable "log_retention_in_days" {
  type        = number
  description = "The retention period for the logs in days"
  default     = 31
}

variable "password_length" {
  type        = number
  description = "length of the password string in bytes"
  default     = 16
}

variable "node_count" {
  type        = number
  description = "Kubernetes cluster node count"
  default     = 2
}

variable "cluster_maximum_count" {
  type        = number
  description = "Maximum nodes to autoscale in a cluster"
  default     = 4
}

variable "cluster_minimum_count" {
  type        = number
  description = "Minimum nodes to autoscale in a cluster"
  default     = 1
}

variable "os_disk_size_gb" {
  type        = number
  description = "Operating System Disk Size in GB for AKS cluster nodes"
  default     = 30
}

variable "maximum_pods_per_node" {
  type        = number
  description = "Maximum pods to run on each node"
  default     = 50
}

variable "virtual_machine_size" {
  type        = string
  description = "Virtual Machine size/type for kubernetes cluster nodes"
  default     = "Standard_B2s"
}
