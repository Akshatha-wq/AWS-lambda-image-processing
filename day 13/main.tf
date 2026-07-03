data "aws_vpc" "vpc_name" {
    filter{
        name= "tag:Name"
        values= ["vpc_1"]
    }
}
data "aws_subnet" "shared" {
    filter{
        name= "tag:Name"
        values= ["my-subnet-1"]
    }
    vpc_id= data.aws_vpc.vpc_name.id
}

data "aws_ami" "linux2" {
    owners= ["amazon"]
    most_recent= true
    filter {
        name= "name"
        values= ["amzn2-ami-hvm-*"]
    }
    filter {
        name= "virtualization-type"
        values= ["hvm"]
    }
}

resource "aws_instance" "example" {
    ami= data.aws_ami.linux2.id
    instance_type= "t2.micro"
    subnet_id= data.aws_subnet.shared.id
}