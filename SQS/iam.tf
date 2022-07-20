######################
##    SQS Policy    ##
######################

## MAIN QUEUE
data "aws_iam_policy_document" "queue" {
  count = length(var.queue_name)
  statement {
    effect    = "Allow"
    resources = [aws_sqs_queue.queue[count.index].arn]
    actions = [
      "sqs:SendMessage"
    ]
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
    condition {
      test     = "StringLike"
      variable = "aws:SourceArn"
      values   = data.aws_sns_topic.topic[*].arn
    }
  }
}

## DLQ
data "aws_iam_policy_document" "dlq" {
  count = length(var.queue_name)
  statement {
    effect    = "Allow"
    resources = [aws_sqs_queue.dlq[count.index].arn]
    actions = [
      "sqs:ReceiveMessage",
      "sqs:SendMessage"
    ]
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
    condition {
      test     = "StringLike"
      variable = "aws:SourceArn"
      values   = [aws_sqs_queue.queue[count.index].arn]
    }
  }
}
