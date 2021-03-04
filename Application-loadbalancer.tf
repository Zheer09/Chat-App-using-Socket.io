resource "aws_lb_target_group" "Target-group"{
	name = "Target-group"
	port = 80 
	protocol = "HTTP"
	vpc_id = aws_vpc.main.id
}

resource "aws_autoscaling_attachment" "TG-attach" {
  autoscaling_group_name = aws_autoscaling_group.Dynamic-IN.id
  alb_target_group_arn   = aws_lb_target_group.Target-group.arn
}

resource "aws_security_group" "SCG"{
	name = "allow_tls"
	vpc_id = aws_vpc.main.id

	ingress {
	  from_port = 80
	  to_port = 80
	  protocol = "tcp"
	  cidr_blocks= ["0.0.0.0/0"]
	}
	
	ingress{
	from_port= 22
	to_port = 22
	protocol = "tcp"
	cidr_blocks = ["0.0.0.0/0"]
	}

	egress {
	 from_port= 0
	 to_port = 0
	 protocol = "-1"
	 cidr_blocks= ["0.0.0.0/0"]
	}
	
	tags = {
	Name = "allow_tls"
	}
}

resource "aws_lb" "app-load"{
	name = "app-load-balancer"
	internal = false
	load_balancer_type= "application"
	security_groups= [aws_security_group.SCG.id]
	subnets = [aws_subnet.P-AV1.id , aws_subnet.P-AV2.id]

}

resource "aws_lb_listener" "attach"{
	load_balancer_arn= aws_lb.app-load.arn
	port = 80
	protocol = "HTTP"

	default_action {
	  type = "forward"
	  target_group_arn = aws_lb_target_group.Target-group.arn
	}
}
