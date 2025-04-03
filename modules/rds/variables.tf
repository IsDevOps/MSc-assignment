variable "db_username" {
  type = string
}

variable "db_password" {
  type      = string
  sensitive = true
}

variable "subnet_ids" {
  description = "List of subnet IDs to deploy the RDS instance into"
  type        = list(string)
}