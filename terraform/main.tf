module "network" {
  source = "./modules/network"
  network_vpc_cidr_block = "10.0.0.0/16"
  network_sn_public_cidr_block = "10.0.1.0/24"
}
module "compute" {
  source = "./modules/compute"
  network_vpc_id  = module.network.network_vpc_id
  network_vpc_cidr_block  = module.network.network_vpc_cidr_block
  network_sn_public_vpc_id  = module.network.network_sn_public_vpc_id
  compute_ami_id    = "ami-02e136e904f3da870"
  compute_instance_type   = "t2.micro"
}