variable "sinks" {
  default = {
    amce-logs = {
      project        = "acme"
      type           = "logging"
      retention_days = "90"
    }
    contoso-logs = {
      project        = "contoso"
      type           = "prototyping"
      retention_days = "60"
    }
  }
}
