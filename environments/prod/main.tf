locals {
  common_tags = {
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "terraform"
  }
}

module "network" {
  source = "../../modules/network"

  project_name         = var.project_name
  environment          = var.environment
  vpc_cidr             = var.vpc_cidr
  availability_zones   = var.availability_zones
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  tags                 = local.common_tags
}

module "security" {
  source = "../../modules/security"

  project_name      = var.project_name
  environment       = var.environment
  vpc_id            = module.network.vpc_id
  allowed_ssh_cidrs = var.allowed_ssh_cidrs
  tags              = local.common_tags
}

module "storage" {
  source = "../../modules/storage"

  project_name = var.project_name
  environment  = var.environment
  tags         = local.common_tags
}
module "compute" {
  source = "../../modules/compute"

  project_name       = var.project_name
  environment        = var.environment
  subnet_ids         = module.network.public_subnet_ids
  security_group_ids = [module.security.web_security_group_id]
  tags               = local.common_tags
}
module "load_balancer" {
  source = "../../modules/load_balancer"

  project_name       = var.project_name
  environment        = var.environment
  vpc_id             = module.network.vpc_id
  public_subnet_ids  = module.network.public_subnet_ids
  security_group_ids = [module.security.web_security_group_id]
  target_instance_id = module.compute.instance_id
  tags               = local.common_tags
}
module "database" {
  source = "../../modules/database"

  project_name       = var.project_name
  environment        = var.environment
  private_subnet_ids = module.network.private_subnet_ids
  security_group_ids = [module.security.web_security_group_id]
  tags               = local.common_tags
}
