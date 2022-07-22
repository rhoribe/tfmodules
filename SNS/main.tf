#########################
##     Topic SNS       ##
#########################

## TOPIC
resource "aws_sns_topic" "topic" {
  name              = "SNS-${var.topic_name}-${var.environment}"
  kms_master_key_id = var.kms_master_key_id
  tags              = var.tags
  delivery_policy   = data.template_file.delivery_policy.rendered
}

########################
## Subscription       ##
########################

resource "aws_sns_topic_subscription" "subscription" {
  count     = length(var.endpoint)
  topic_arn = aws_sns_topic.topic.arn
  protocol  = var.protocol
  endpoint  = var.endpoint[count.index]
  depends_on = [
    aws_sns_topic.topic
  ]
}