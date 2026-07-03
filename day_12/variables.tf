# ==============================================================================
# ASSIGNMENT 1: Project Naming Convention
# ==============================================================================

variable "instance_type" {
    type = string
    description = "EC2 instnce type"
    default = "t2.micro"

validation {
    condition = length(var.instance_type) >= 2 && length(var.instance_type) <= 20 
    error_message = " Instance type must between 2 and 20 characters"
}

validation {
    condition = can(regex("^t[2-3]\\.", var.instance_type))
    error_message = "instance type must start with t2 or t3"
}
}

variable credentials {
    default = "xyz1234"
    sensitive= true
}

# Assignment on TYPE CONVERSION

variable "user_locations" {
    default = ["us-east-1","us-west-1","ap-south-2","us-east-1"]
}
variable "default_locations" {
    default = ["us-east-1"]
}

variable "monthly_costs" {
    default = [-50,100,70,-20,40]
}