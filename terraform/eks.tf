module "eks" {

  source  = "terraform-aws-modules/eks/aws"
  version = "20.8.5"

  cluster_name    = "capstone-eks"
  cluster_version = "1.31"

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  cluster_endpoint_public_access           = true
  enable_cluster_creator_admin_permissions = true


  eks_managed_node_groups = {

    worker_nodes = {

      desired_size = 1

      min_size = 1

      max_size = 2

      instance_types = ["t3.small"]

      capacity_type = "ON_DEMAND"
    }
  }

  tags = {
    Project = "Capstone"
  }
}
