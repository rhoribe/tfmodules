data "aws_sns_topic" "topic" {
count      = length(var.topic_name)  
name = var.topic_name[count.index]
}