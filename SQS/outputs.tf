output "queue_id" {
  description = "Queue ID"
  value       = aws_sqs_queue.queue[*].id
}

output "dlq_id" {
  description = "DLQ ID"
  value       = aws_sqs_queue.dlq[*].id
}

output "queue_arn" {
  description = "Queue arn"
  value       = aws_sqs_queue.queue[*].arn
}

output "dlq_arn" {
  description = "DLQ arn"
  value       = aws_sqs_queue.dlq[*].arn
}