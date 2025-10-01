# Terraform Infra

This repository provides a modular, multi-cloud Terraform infrastructure setup supporting AWS, Azure, GCP, and Kubernetes. It is organized for scalability, reusability, and environment separation.

## Structure

```
terraform-infra/
├── providers/      # Provider-specific configs (AWS, Azure, GCP, Kubernetes)
├── modules/        # Reusable modules (network, compute, database, storage)
├── envs/           # Environment-specific variable files (dev, staging, prod)
├── versions.tf     # Terraform and provider version requirements
├── backend.tf      # Remote state configuration
└── README.md
```

## Getting Started

1. **Install Terraform**  
   Download and install Terraform from [terraform.io](https://www.terraform.io/downloads.html).

2. **Configure Provider Credentials**  
   - AWS: Set up your AWS credentials (`~/.aws/credentials` or environment variables).
   - Azure: Authenticate via `az login` or set environment variables.
   - GCP: Set up your service account and `GOOGLE_APPLICATION_CREDENTIALS`.
   - Kubernetes: Ensure your `kubeconfig` is available.

3. **Select Environment**  
   Choose the environment (`dev`, `staging`, `prod`) and provider (`aws`, `azure`, `gcp`, `kubernetes`).

4. **Initialize Terraform**  
   Navigate to the provider directory and initialize:
   ```sh
   cd providers/aws
   terraform init
   ```

5. **Plan and Apply**  
   Use the appropriate environment tfvars file:
   ```sh
   terraform plan -var-file=../../envs/dev/aws.tfvars
   terraform apply -var-file=../../envs/dev/aws.tfvars
   ```

   Replace `dev` and `aws` with your target environment and provider.

## Modules

Reusable modules are in `modules/` and can be referenced from provider configs:
```hcl
module "network" {
  source = "../../modules/network"
  # module variables...
}
```

## Remote State

Remote state is configured in `backend.tf`. Update the backend config as needed for your cloud provider.

## Customization

- Edit variables in `providers/<provider>/variables.tf` and `terraform.tfvars`.
- Override variables per environment in `envs/<env>/<provider>.tfvars`.

## Example: Deploy AWS S3 Bucket in Dev

```sh
cd providers/aws
terraform init
terraform plan -var-file=../../envs/dev/aws.tfvars
terraform apply -var-file=../../envs/dev/aws.tfvars
```

## Outputs

After apply, Terraform will show resource outputs defined in `outputs.tf`.

## License

MIT
