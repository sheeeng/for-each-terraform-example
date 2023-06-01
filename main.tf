resource "null_resource" "sinks" {
  for_each = toset([for k, v in var.sinks : k if v.type == "logging"])

  triggers = {
    sequence   = each.key
    always_run = "${timestamp()}"
  }

  provisioner "local-exec" {
    interpreter = ["bash", "-c"]
    command     = "echo ${each.key}, ${each.value}, ${var.sinks[each.key].retention_days}"
  }
}

output "retention_days" {
  value = [for item in var.sinks : item.retention_days]
}
