resource "aws_lb_target_group" "Target-group"{
	name = "Target-group"
	port = 80 
	protocol = "HTTP"
	vpc_id = aws_vpc.main.id
}

data "aws_autoscaling_group" "Dynamic-EC2-instance"{
	name = "Dynamic-EC2-instance"

}

resource "aws_autoscaling_attachment" "TG-attach" {
  autoscaling_group_name = aws_autoscaling_group.Dynamic-IN.id
  alb_target_group_arn   = aws_lb_target_group.Target-group.arn
}



