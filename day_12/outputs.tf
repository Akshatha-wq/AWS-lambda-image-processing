# ASSIGNMENT 6

output "validated_instance_type" {
    description ="validated instance type"
    value = var.instance_type
}

output "validated_instance_id" {
    description ="validated instance id"
    value= aws_instance.validated_instance.id
}

output "credentials" {
    value = var.credentials
    sensitive = true
}

output "all_locations" {
    value = local.all_locations
}
output "unique_locations" {
    value = local.unique_locations
}

output "positive_costs" {
    value = local.positive_costs
}

output "max_costs" {
    value = local.max_cost
}

output "min_costs" {
    value = local.min_cost
}

output "timestamp" {
    value= local.current_timestamp
}

output "format1_timestamp" {
    value = local.format_1
}

output "format2_timestamp" {
    value= local.format_2
}

output "config" {
    value= local.config_data
}