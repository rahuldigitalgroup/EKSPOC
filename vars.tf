variable "cluster_name" {
  type        = string
  default     = ""
  description = "Name of the EKS Cluster"
}

variable "cluster_version" {
  type        = string
  default     = "1.28"
  description = "Version of the cluster"
}
variable "instance_kind" {
  type        = string
  default     = ""
  description = "Instance type in node pool"
}

variable "subnet_ids" {
  description = "List of subnet IDs for the EKS cluster"
  type        = list(string)
}
variable "vpc_id" {
  type        = string
  default     = ""
  description = "description"
}
variable "instance_type" {
  type        = string
  default     = ""
  description = "description"
}


