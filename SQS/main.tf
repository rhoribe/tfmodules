#########################
##         SQS         ##
#########################

## DLQ
resource "aws_sqs_queue" "dlq" {
  count                             = length(var.queue_name)
  name                              = "${var.featurename}-${element(var.queue_name, count.index)}-dlq-${var.environment}"
  message_retention_seconds         = var.message_retention_seconds_dlq
  visibility_timeout_seconds        = var.visibility_timeout_seconds_dlq
  kms_master_key_id                 = var.kms_master_key_id
  kms_data_key_reuse_period_seconds = var.kms_data_key_reuse_period_seconds
  max_message_size                  = var.max_message_size
  delay_seconds                     = var.delay_seconds
  receive_wait_time_seconds         = var.receive_wait_time_seconds
  fifo_queue                        = var.fifo_queue
  content_based_deduplication       = var.content_based_deduplication
  tags                              = var.tags
}

resource "aws_sqs_queue_policy" "dlq-policy" {
  count      = length(var.queue_name)
  queue_url  = aws_sqs_queue.dlq[count.index].id
  policy     = data.aws_iam_policy_document.dlq[count.index].json
  depends_on = [aws_sqs_queue.dlq]
}

## MAIN QUEUE
resource "aws_sqs_queue" "queue" {
  count                      = length(var.queue_name)
  name                       = "${var.featurename}-${element(var.queue_name, count.index)}-${var.environment}"
  visibility_timeout_seconds = var.visibility_timeout_seconds
  message_retention_seconds  = var.message_retention_seconds
  max_message_size           = var.max_message_size
  delay_seconds              = var.delay_seconds
  receive_wait_time_seconds  = var.receive_wait_time_seconds
  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.dlq[count.index].arn
    maxReceiveCount     = var.maxReceiveCount
  })
  fifo_queue                        = var.fifo_queue
  content_based_deduplication       = var.content_based_deduplication
  kms_master_key_id                 = var.kms_master_key_id
  kms_data_key_reuse_period_seconds = var.kms_data_key_reuse_period_seconds
  tags                              = var.tags
  depends_on                        = [aws_sqs_queue.dlq]
}

resource "aws_sqs_queue_policy" "queue-policy" {
  count      = length(var.queue_name)
  queue_url  = aws_sqs_queue.queue[count.index].id
  policy     = data.aws_iam_policy_document.queue[count.index].json
  depends_on = [aws_sqs_queue.queue]
}