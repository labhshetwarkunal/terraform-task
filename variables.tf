variable "project_id" {
  description = "The ID of the project to deploy resources"
  type        = string
  default     = "dg-poc-host"  
}

variable "region" {
  description = "The region to deploy resources"
  type        = string
  default     = "asia-south1"
}

variable "db_instance_name" {
  description = "The name of the Cloud SQL instance"
  type        = string
  default     = "my-sql-instance"
}

variable "db_name" {
  description = "The name of the Cloud SQL database"
  type        = string
  default     = "my-database"
}

variable "db_user" {
  description = "The database user"
  type        = string
  default     = "db-user"
}

variable "db_password" {
  description = "The database password"
  type        = string
  default     = "db-password"
}

variable "service_name" {
  description = "The name of the Cloud Run service"
  type        = string
  default     = "my-cloud-run-service"
}

variable "image" {
  description = "The container image for Cloud Run service"
  type        = string
  default     = "us-docker.pkg.dev/cloudrun/container/hello"
}
