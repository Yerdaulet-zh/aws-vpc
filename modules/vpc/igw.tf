resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.this.id
  tags = {
    Project = "${var.global.project_name}"
  }
}
