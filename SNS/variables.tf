#############################################
# SNS VARIABLES
#############################################
variable "topic_name" {
  description = "Nome do topico"
  type        = string
}

variable "endpoint" {
  description = "Endpoints para  subscrição"
  type        = list(string)
}

variable "protocol" {
  description = "Tipo de subscribe"
  type        = string
}

variable "kms_master_key_id" {
  description = "Chave  KMS"
  type        = string
}

#############################################
# COMMONS VARIABLES
#############################################

variable "environment" {
  description = "Ambiente  Dev/Homol/Prod"
  type        = string
}

variable "tags" {
  description = "Tags padrões"
  type        = map(string)
}

