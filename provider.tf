provider "aws" {
	region = "us-east-2"
}

resource "aws_key_pair" "acc" {
	key_name="access-key"
	public_key="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCyWsjgaMO1UWl8PaYHKvu1iEaYtnJCRLp03hBHQVbCN395ByZhQaQe//TgoNPT2rR3HerYPQD8XMbvTZIJ+CBojlhWK/Dp3gnslcm37vJcxMVr09yLV58gA3k3E6kd55zILp9BwoM2xAsE2sq5w32KsIsfp6oj8ZfAl4f+IqhjquH85TGt0g8ZAlBtmmJLnCbSBW4WlGslW1mgWsQVoY1zNSdWUI4J1qyJKGTFKcYG/z9xAj518CuUnjlB4eLBxgMdsGi+XZZmCTR+MwX5f7pgiPh5omtk46EHax2UMO8/ukdZMFOkv116VRtGZBINzGq15VDKkDqWR+hIC/ELv/1qdNXns34iOjMBH8u1UMRwOeV09/05Gt/MzR2Os6lfJ+Yz1xhaPB+CHQkd3w85PhzNEfM8sHXUwJ46I7i1cgh8oo7/Qso6Cxk062Ft5pvM+Eq6LUonMURoX2NcYW1oboLbDQpA/hyY1SkMddAaiTUX/UQKFf24DNuYOWYm+cilDLro1I/3CP2O0c1Rhyjrvb7is3EtVGFmN9MQh6pRnvFejAdFQcn5xXO8E4oPfCVVnng3ASo84BrmL2w1AhiytKwPbRy5BESLMODq2B6gi3g9PdFUt27XakqqIxLS1YblpGvEJvLkBGAoyIR4cjH3EiIls4R+BRgjFzH1lELELhI15w== gitlab"
}
