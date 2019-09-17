/**
* This file should be linked to every project. It defined required tags and protects accounts from anauthorized modifications.
*/

variable aws_account_id {}
variable aws_region {}

provider aws {
  region              = "${var.aws_region}"
  allowed_account_ids = ["${var.aws_account_id}"]
}
