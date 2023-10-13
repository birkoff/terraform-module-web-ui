variable "hosted_zone_name" {}
variable "hosted_zone_id" {}


variable "bucket_region" {
  description = "Region of the S3 bucket"
}

variable "bucket_force_destroy" {
  default = "false"
}

variable "cloudfront_function_publish" {
  default = true
}

variable "comment" {
  type    = string
  default = ""
}


variable "frontend_subdomain_aliases" {
  type    = list(string)
  default = []
}

#variable "logs_bucket" {
#  type    = string
#  default = ""
#}

variable "acm_certificate_arn" {
  type    = string
  default = ""
}
