resource "aws_launch_configuration" "OS-Type"{
	name_prefix = "OS-Type"

	image_id = "ami-0996d3051b72b5b2c"
	instance_type = "t2.micro"
	security_groups = [aws_security_group.SCG.id]
	associate_public_ip_address = true
	key_name = "access-key"
	lifecycle {
	 create_before_destroy = true
	}
}

resource "aws_autoscaling_group" "Dynamic-IN"{
	name = "Dynamic-EC2-instance"
	min_size = 1
	max_size = 2
	desired_capacity = 2
	health_check_type = "EC2"
	launch_configuration = aws_launch_configuration.OS-Type.name
	vpc_zone_identifier = [aws_subnet.P-AV1.id, aws_subnet.P-AV2.id]
	target_group_arns=[aws_lb_target_group.Target-group.arn]

	lifecycle {
	  create_before_destroy = true
	}

}
