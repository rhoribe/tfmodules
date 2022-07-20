#############################################
# SQS VARIABLES
#############################################
variable "queue_name" {
  description = "Nome da fila"
  type        = list(string)
}

variable "visibility_timeout_seconds" {
  description = "Quantidade de tempo que a mensagem ficará em processamento e, portanto, invisível para outros consumidores."
  type        = number
}

variable "message_retention_seconds" {
  description = "Quantidade de tempo que a mensagem ficará na fila, se não excluída explicitamente"
  type        = number
}

variable "max_message_size" {
  description = "Tamanho máximo em bytes do corpo da mensagem."
  type        = number
}

variable "delay_seconds" {
  description = "Quantidade de segundos antes de deixar a mensagem visível para consumo"
  type        = number
}

variable "receive_wait_time_seconds" {
  description = "Tempo esperado pelo consumidor para receber uma mensagem."
  type        = number
}

variable "fifo_queue" {
  description = "Flag para controle que dita se esta fila é uma fila FIFO ou não. Se `true`, o nome da fila deve ter o sufixo .fifo"
  type        = bool
}

variable "content_based_deduplication" {
  description = "Flag para controle de exlusão de mensagens com o mesmo conteúdo em um intervalo de 5 minutos. Somente válido para filas FIFO"
  type        = bool
}

variable "maxReceiveCount" {
  description = "Número de vezes que um consumidor tenta receber uma mensagem de uma fila  antes de mover  para uma DLQ"
  type        = number
}


variable "visibility_timeout_seconds_dlq" {
  description = "Quantidade de tempo que a mensagem ficará em processamento e, portanto, invisível para outros consumidores"
  type        = number
}

variable "message_retention_seconds_dlq" {
  description = "Quantidade de tempo que a mensagem ficará no DLQ"
  type        = number
}

variable "kms_data_key_reuse_period_seconds" {
  description = "Tempo de  reuso"
  type        = number
}

variable "kms_master_key_id" {
  description = "Chave  KMS"
  type        = string
}

variable "topic_name" {
  description = "Nome do tópico usado como source na policy"
  type        = list(string)
}

#############################################
# COMMONS VARIABLES
#############################################
variable "featurename" {
  description = "Nome da feature"
  type        = string
}

variable "environment" {
  description = "Ambiente  Dev/Homol/Prod"
  type        = string
}

variable "tags" {
  description = "Tags padrões"
  type        = map(string)
}
