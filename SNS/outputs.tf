output "topic_arn" {
  description = "ARN do Tópico"
  value       = aws_sns_topic.topic.arn
}

output "topic_id" {
  description = "ID do Tópico"
  value       = aws_sns_topic.topic.id
}

output "subscription_arn" {
  description = "ARN da subscrição"
  value       = aws_sns_topic_subscription.subscription[*].arn
}

output "subscription_id" {
  description = "ID da subscrição"
  value       = aws_sns_topic_subscription.subscription[*].id
}