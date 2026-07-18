provider "aws" {
  region = "us-east-1"
}

data "aws_caller_identity" "current" {}

resource "terraform_data" "ci_test" {
  input = {
    message        = "Terraform CI/CD completed successfully"
    aws_account_id = data.aws_caller_identity.current.account_id
  }
}

output "ci_test_result" {
  value = terraform_data.ci_test.output
}