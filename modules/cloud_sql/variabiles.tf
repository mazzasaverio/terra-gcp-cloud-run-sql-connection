variable "gcp_project_id" {
  description = "The GCP project ID."
  type        = string
}

variable "gcp_db_instance_name" {
  description = "The name of the db instance."
  type        = string
}

variable "gcp_region" {
  description = "The region where the resources will be created."
  type        = string
}
variable "cloud_sql_proxy_source_range" {
  description = "Source IP range for Cloud SQL proxy."
  type        = string
}

variable "gcp_db_version" {
  description = "The database version to use."
  default     = "POSTGRES_15"
}


variable "gcp_service_account_email" {
  description = "The email of the service account to grant access to the Cloud SQL instance."
  type        = string
}

variable "network_id" {
  description = "The ID of the VPC network."
  type        = string
}
