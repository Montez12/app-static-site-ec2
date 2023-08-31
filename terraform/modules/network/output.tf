output "network_vpc_pub_cidr_block" {
  value = aws_vpc.vpc.cidr_block
}

output "network_vpc_id" {
  value = aws_vpc.vpc.id
}

output "network_sn_public_id" {
  value = aws_subnet.sn_public.id
}
