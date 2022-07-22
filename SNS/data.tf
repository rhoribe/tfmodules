data "aws_caller_identity" "current" {}

data "template_file" "delivery_policy" {
  template = file("${path.module}/delivery_policy.json.tpl")
}