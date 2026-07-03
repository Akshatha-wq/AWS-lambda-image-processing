# ASSIGNMENT 6 : VALIDATION 

data "aws_ami" "validation_ami"{
    most_recent= true
    owners= ["amazon"]

filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
}
}

locals {
    all_locations= concat(var.user_locations, var.default_locations)
    unique_locations= toset(local.all_locations)

    # numeric functions
    positive_costs= [for cost in var.monthly_costs : abs(cost) ]
    max_cost= max(local.positive_costs...)
    min_cost= min(local.positive_costs...)

    #timestamp functions
    current_timestamp= timestamp()

    # Different formats of timestamps
    format_1= formatdate("yyMMdd",local.current_timestamp)
    format_2= formatdate("YYYY-MM-DD",local.current_timestamp)

    config_file_exists= fileexists("./config.json")
    config_data= local.config_file_exists ? jsondecode(file("./config.json")) : {}
}
resource "aws_instance" "validated_instance"{
    ami = data.aws_ami.validation_ami.id
    instance_type = var.instance_type

tags = {
    name= "validation-instance"
    type= var.instance_type
}
}
