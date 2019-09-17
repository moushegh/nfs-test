terraform {
  backend s3 {
    bucket         = "mush-fra-ops"
    key            = "states/nfs"
    region         = "eu-central-1"
    encrypt        = true
  }
}
